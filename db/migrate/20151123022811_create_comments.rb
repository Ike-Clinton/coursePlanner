class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :from_user
      t.text :body
      t.integer :user_id

      t.timestamps null: false
    end
    add_foreign_key :comments, :users
  end
end
