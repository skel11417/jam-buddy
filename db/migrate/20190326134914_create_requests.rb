class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :musician_id
      t.integer :opening_id
      t.string :message
      t.string :musician_status
      t.string :band_status

      t.timestamps
    end
  end
end
