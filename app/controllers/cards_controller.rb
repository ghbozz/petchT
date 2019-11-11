class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update]
  skip_before_action :verify_authenticity_token, only: [:create]

  def show
    authorize @card
  end

  def new
    @card = Card.new
    authorize @card
  end

  def create
    raise
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

  def edit
    skip_authorization
  end

  def update
    @card.update(card_params)
    params[:card][:specificities].each do |key, value|
      @card.specificities[key] = value
    end
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
    params.require(:card).permit(
      :animal,
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
