class CreateOpenings < ActiveRecord::Migration[5.2]
  def change
    create_table :openings do |t|
      t.integer :band_id
      t.integer :instrument_id
      t.string :commitment
      t.string :description

      t.timestamps
    end
  end
end
