class AddCompletedToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :completed, :boolean
  end
end
