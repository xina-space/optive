class AddActivityIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :activity_id, :integer
  end
end
