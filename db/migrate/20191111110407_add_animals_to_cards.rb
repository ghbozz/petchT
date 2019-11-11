class AddAnimalsToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :animal, :string
  end
end
