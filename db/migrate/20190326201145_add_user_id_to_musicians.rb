class AddUserIdToMusicians < ActiveRecord::Migration[5.2]
  def change
    add_column :musicians, :user_id, :integer
  end
end
