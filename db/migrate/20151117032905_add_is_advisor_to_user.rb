class AddIsAdvisorToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_advisor, :string
  end
end
