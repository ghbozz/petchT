class AddTitlesToBrands < ActiveRecord::Migration[6.0]
  def change
    add_column :brands, :title_1, :string
    add_column :brands, :title_2, :string
    add_column :brands, :title_3, :string
  end
end
