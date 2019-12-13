class Admin::ProductsController < ApplicationController
  def create
    @product = Product.new(product_params)
    @product.brand = Brand.friendly.find(params[:brand_id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :thumbnail)
  end
end
