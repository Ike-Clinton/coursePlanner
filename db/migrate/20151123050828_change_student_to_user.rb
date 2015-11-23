class ChangeStudentToUser < ActiveRecord::Migration
  def change
    rename_column :comments, :student_id, :user_id
  end
end
