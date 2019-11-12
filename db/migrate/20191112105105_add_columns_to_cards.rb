class AddColumnsToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :status, :string
  end
end
