class AddDetailsToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :title, :string
    add_column :cards, :body, :text
    add_column :cards, :life_expectancy, :integer
    add_column :cards, :fur, :string
    add_column :cards, :min_height, :integer
    add_column :cards, :max_height, :integer
    add_column :cards, :min_weight, :integer
    add_column :cards, :max_weight, :integer
  end
end
