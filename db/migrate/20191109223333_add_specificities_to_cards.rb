class AddSpecificitiesToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :specificities, :json, default: {}
  end
end
