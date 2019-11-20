class Admin::CardsController < ApplicationController
  def publish
    @card = Card.find(params[:card_id])
    @card.update(status: 'published')
    redirect_to admin_profile_path
  end

  def unpublish
    @card = Card.find(params[:card_id])
    @card.update(status: 'draft')
    redirect_to admin_profile_path
  end
end
