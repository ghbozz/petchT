class Admin::CardsController < ApplicationController
  def publish
    @card = Card.find(params[:card_id])
    @card.update(status: 'published')

    respond_to do |format|
      format.html { redirect_to admin_profile_path }
      format.js
    end
  end

  def unpublish
    @card = Card.find(params[:card_id])
    @card.update(status: 'draft')

    respond_to do |format|
      format.html { redirect_to admin_profile_path }
      format.js
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    respond_to do |format|
      format.html { redirect_to admin_profile_path }
      format.js
    end
  end
end
