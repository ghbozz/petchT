class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :description
      t.text :paragraph_1
      t.text :paragraph_2
      t.text :paragraph_3

      t.timestamps
    end
  end
end
