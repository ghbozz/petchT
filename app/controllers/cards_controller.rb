class CardsController < ApplicationController
  before_action :set_card, only: [:show]

  def show
    authorize @card
  end

  def new
    @card = Card.new
    skip_authorization
  end

  def create
    raise
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end
end
