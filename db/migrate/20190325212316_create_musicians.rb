class CreateMusicians < ActiveRecord::Migration[5.2]
  def change
    create_table :musicians do |t|
      t.string :name
      t.string :image_url
      t.string :bio
      t.string :availabiity
      t.string :location

      t.timestamps
    end
  end
end
