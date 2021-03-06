class CardsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_card, only: [:show, :edit, :update, :submit]

  def index
    if params[:animal]
      @cards = policy_scope(Card).animal_scope(params[:animal])
    else
      @cards = policy_scope(Card).published
      @cards = helpers.cards_search(@cards, params)
    end

    @pagy, @cards = pagy(
      @cards,
      items: 24,
      link_extra: 'data-remote="true"'
    )
  end

  def show
    authorize @card

    @caracs = set_caracs(@card)
    @fci = @card.specificities.find { |k, v| k == 'fci' }

    @animal = @card.animal.name
    @recomandations = Card.where(status: 'published')
                          .where.not(id: @card.id)
                          .select { |c| c.animal == @card.animal }
                          .sample(3)
  end

  def new
    @card = Card.new
    authorize @card
  end

  def create
    @card = Card.new(card_params.merge(user: current_user))
    @card.set_specs_and_ratings(params)
    @card.specie = set_specie(params)
    @card.animal = Animal.find_by(name: params[:animal])

    authorize @card
    if @card.save
      redirect_to card_path(@card)
    else
      render :new, animal: params[:animal]
    end
  end

  def edit
    params[:animal] = Card.friendly.find(params[:id]).specie.animal.name
    authorize @card
  end

  def update
    @card.update(card_params)
    @card.set_specs_and_ratings(params)
    @card.specie.update(name: params[:card][:specie])

    authorize @card
    if @card.save
      redirect_to card_path(@card)
    else
      render :edit
    end
  end

  def init
    @card = Card.new
    authorize @card
  end

  private

  def set_specie(params)
    if !params[:card][:specie].empty?
      Specie.create(
        animal: Animal.find_by(name: params[:animal]),
        name: params[:card][:specie]
      )
    end
  end

  def set_card
    @card = Card.friendly.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:origin, :min_height, :max_height, :min_weight, :max_weight, :title, :body, :life_expectancy, :subtitle, :thumbnail)
  end

  def set_caracs(card)
    if card.animal.name == 'rongeur'
      return caracs = {
        origine: @card.origin,
        espérance_de_vie: "#{@card.life_expectancy} ans",
        hauteur: "#{@card.min_height} - #{@card.max_height} cm",
        poids: "#{@card.min_weight * 100} - #{@card.max_weight * 100} gr",
      }
    else
      return caracs = {
        origine: @card.origin,
        espérance_de_vie: "#{@card.life_expectancy} ans",
        hauteur: "#{@card.min_height} - #{@card.max_height} cm",
        poids: "#{@card.min_weight} - #{@card.max_weight} kg",
      }
    end
  end

end
