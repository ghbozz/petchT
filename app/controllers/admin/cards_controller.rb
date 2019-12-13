class Admin::CardsController < ApplicationController
  def publish
    authorize :dashboard, :publish?

    @card = Card.friendly.find(params[:card_id])
    @card.update(status: 'published')

    respond_to do |format|
      format.html { redirect_to admin_profile_path }
      format.js
    end
  end

  def unpublish
    authorize :dashboard, :publish?

    @card = Card.friendly.find(params[:card_id])
    @card.update(status: 'draft')

    respond_to do |format|
      format.html { redirect_to admin_profile_path }
      format.js
    end
  end

  def destroy
    authorize :card, :destroy?

    @card = Card.friendly.find(params[:id])
    @card.destroy

    respond_to do |format|
      format.html { redirect_to admin_profile_path }
      format.js
    end
  end
end
