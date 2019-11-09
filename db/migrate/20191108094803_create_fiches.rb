class CreateFiches < ActiveRecord::Migration[6.0]
  def change
    create_table :fiches do |t|
      t.string :animal
      t.string :race
      t.string :origin
      t.string :title
      t.string :description
      t.string :spec_1
      t.string :spec_2
      t.string :spec_3
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
