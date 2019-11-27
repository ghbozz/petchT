class AddTopToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :top, :boolean, default: false
  end
end
