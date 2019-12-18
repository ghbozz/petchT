class Admin::BrandsController < ApplicationController
  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      @brand.set_targets(params)
      redirect_to brand_path(@brand)
    else
      render :new
    end
  end

  def edit
    @brand = Brand.friendly.find(params[:id])
  end

  def update
    @brand = Brand.friendly.find(params[:id])
    @brand.update(brand_params)
    @brand.set_targets(params)
    redirect_to brand_path(@brand)
  end

  def destroy
    authorize :brand, :destroy?

    @brand = Brand.friendly.find(params[:id])
    @brand.destroy

    respond_to do |format|
      format.html { redirect_to admin_profile_path }
      format.js
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :description, :banner, :logo,
      sections_attributes: [:id, :title, :_destroy, paragraphs_attributes: [:id, :title, :body, :thumbnail, :_destroy]])
  end
end
