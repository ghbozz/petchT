class AddSubtitleOnCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :subtitle, :string
  end
end
