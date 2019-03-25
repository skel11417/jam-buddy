class CreateInstrumentMusicians < ActiveRecord::Migration[5.2]
  def change
    create_table :instrument_musicians do |t|
      t.integer :musician_id
      t.integer :instrument_id

      t.timestamps
    end
  end
end
