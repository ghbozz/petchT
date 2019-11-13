require 'json'

class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update]
  skip_before_action :verify_authenticity_token, only: [:create]

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
    @card = Card.new
    authorize @card
    @specs = Card::SPECS.to_json
    @ratings = Card::RATINGS.to_json
  end

  def create
    raise
    @card = Card.create!(card_params)
    authorize @card
    redirect_to edit_card_path(@card)
  end

  def edit
    authorize @card
  end

  def update
    @card.update(card_params)
    @card.set_specificities(params)
    if @card.save
      redirect_to card_path(@card)
    else
      render :edit
    end
    skip_authorization
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:animal, :fci, :origin, :min_height, :max_height, :min_weight, :max_weight, :title, :body, :life_expectancy, :thumbnail)
  end
end
