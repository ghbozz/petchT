class CardsController < ApplicationController
  before_action :set_card, only: [:show]

  def show
    authorize @card
  end

  def new
    @card = Card.new
    authorize @card
  end

  def create
    @card = Card.new(card_params)
    params[:card][:specificities].each do |key, value|
      @card.specificities[key] = value
    end
    if @card.save
      redirect_to card_path(@card)
    else
      render :new
    end
    authorize @card
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(
      :title,
      :body,
      :fci,
      :origin,
      :fur,
      :life_expectancy,
      :min_height,
      :max_height,
      :min_weight,
      :max_weight,
      )
  end
end
