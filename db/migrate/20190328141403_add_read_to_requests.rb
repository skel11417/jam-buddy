class AddReadToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :read, :boolean
  end
end
