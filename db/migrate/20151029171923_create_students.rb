class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :academic_class
      t.string :advisor
      t.text :classes

      t.timestamps null: false
    end
  end
end
