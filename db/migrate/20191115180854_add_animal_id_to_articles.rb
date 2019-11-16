class AddAnimalIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :animal, index: true
  end
end
