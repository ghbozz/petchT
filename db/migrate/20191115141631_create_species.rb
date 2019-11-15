class CreateSpecies < ActiveRecord::Migration[6.0]
  def change
    create_table :species do |t|
      t.string :name
      t.references :animal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
