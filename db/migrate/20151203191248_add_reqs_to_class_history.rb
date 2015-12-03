class AddReqsToClassHistory < ActiveRecord::Migration
  def change
    # Pre-reqs will be a space-delimited list of class IDs that a student
    # must have beforel signing up for a class
    add_column :class_histories, :pre_reqs, :string
  end
end
