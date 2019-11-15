class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      t.string :theme
      t.string :status, default: 'draft'
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
