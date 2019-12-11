module BrandsHelper
  def brands_search(brands, params)
    if params[:filter_data]

      if params[:filter_data][:query].present?
        brands = brands.brands_search(params[:filter_data][:query])
      end

      if params[:animals]
        animals = Animal.where(name: params[:animals].select { |k, v| v == '1' }.keys)

        if !animals.empty?
          brands = brands.select { |b| (b.animals.pluck(:name) & animals.pluck(:name)).any? }
          brands = Brand.where(id: brands.map(&:id)) if !animals.empty?
        end
      end

    end

    return brands
  end
end
