class AddAcademicClassToUser < ActiveRecord::Migration
  def change
    add_column :users, :academic_class, :string
  end
end
