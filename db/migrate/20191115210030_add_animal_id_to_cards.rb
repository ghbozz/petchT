class AddAnimalIdToCards < ActiveRecord::Migration[6.0]
  def change
    add_reference :cards, :animal, index: true
  end
end
