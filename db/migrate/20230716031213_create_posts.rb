class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.integer :status, default:0

      t.timestamps
    end
  end
end
