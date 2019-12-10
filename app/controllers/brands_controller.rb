class BrandsController < ApplicationController
  before_action :set_brand, only: [:show]

  def index
    @brands = policy_scope(Brand)

    @pagy, @brands = pagy(
      @brands,
      items: 12,
      link_extra: 'data-remote="true"'
    )
  end

  def show
    authorize @brand
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end
end
