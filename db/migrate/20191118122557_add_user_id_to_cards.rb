class AddUserIdToCards < ActiveRecord::Migration[6.0]
  def change
    add_reference :cards, :user, index: true
  end
end
