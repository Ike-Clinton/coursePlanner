class CreateClassHistories < ActiveRecord::Migration
  def change
    create_table :class_histories do |t|
      t.string :email
      t.string :class_name
      t.string :crn

      t.timestamps null: false
    end
  end
end
