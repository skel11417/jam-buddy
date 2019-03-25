class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.string :musician_id
      t.string :name
      t.string :image_url
      t.string :status
      t.string :link

      t.timestamps
    end
  end
end
