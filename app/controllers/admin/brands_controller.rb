class Admin::BrandsController < ApplicationController
  def new
    authorize :brand, :new?
    @brand = Brand.new
  end

  def create
    authorize :brand, :create?
    @brand = Brand.new(brand_params)

    if @brand.save
      @brand.set_targets(params)
      redirect_to brand_path(@brand)
    else
      render :new
    end
  end

  def edit
    authorize :brand, :edit?
    @brand = Brand.friendly.find(params[:id])
  end

  def update
    authorize :brand, :update?
    @brand = Brand.friendly.find(params[:id])

    if @brand.update(brand_params)
      @brand.set_targets(params)
      redirect_to brand_path(@brand)
    else
      render :edit
    end
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
