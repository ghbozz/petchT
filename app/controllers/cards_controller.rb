require 'json'

class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update]

  def index
    if params[:animal]
      @cards = policy_scope(Card.where(status: 'published', animal: params[:animal]))
    else
      @cards = policy_scope(Card).where(status: 'published')
    end

   
    @pagy, @cards = pagy(
      helpers.index_search(@cards, params),
      items: 10,
      link_extra: 'data-remote="true"'
    )
  end

  def show
    authorize @card

    @card_animal = @card.animal
  end

  def new
    @card = Card.new(card_params)
    authorize @card
    @specs = Card::SPECS.to_json
    @ratings = Card::RATINGS.to_json
  end

  def create
    @card = Card.new(card_params)
    @card.set_specs_and_ratings(params)
    @card = Card.create!(card_params)
    authorize @card
    if @card.save
      redirect_to card_path(@card)
    else
      render :new
    end
  end

  def edit
    authorize @card
  end

  def update
    @card.update(card_params)
    @card.set_specificities(params)
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

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:animal, :origin, :min_height, :max_height, :min_weight, :max_weight, :title, :body, :life_expectancy, :thumbnail)
  end
end
