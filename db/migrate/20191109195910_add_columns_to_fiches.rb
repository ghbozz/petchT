class AddColumnsToFiches < ActiveRecord::Migration[6.0]
  def change
    add_column :fiches, :status, :string
  end
end
