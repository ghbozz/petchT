class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :fci
      t.string :origin

      t.timestamps
    end
  end
end
