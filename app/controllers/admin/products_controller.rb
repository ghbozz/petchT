class Admin::ProductsController < ApplicationController
  def create
    @product = Product.new(product_params)
    @product.brand = Brand.friendly.find(params[:brand_id])

    if @product.save
      respond_to do |format|
        format.html { redirect_to admin_profile_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to admin_profile_path }
        format.js
      end
    end
  end

  def destroy
    @product = Product.friendly.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to admin_profile_path }
      format.js
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :thumbnail)
  end
end
