class AddSpecieIdToCards < ActiveRecord::Migration[6.0]
  def change
    add_reference :cards, :specie, index: true
  end
end
