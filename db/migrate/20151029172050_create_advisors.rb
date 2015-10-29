class CreateAdvisors < ActiveRecord::Migration
  def change
    create_table :advisors do |t|
      t.string :name
      t.text :list_of_students

      t.timestamps null: false
    end
  end
end
