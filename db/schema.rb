ActiveRecord::Schema.define(version: 2019_03_26_134914) do

  create_table "band_genres", force: :cascade do |t|
    t.integer "band_id"
    t.integer "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bands", force: :cascade do |t|
    t.string "musician_id"
    t.string "name"
    t.string "image_url"
    t.string "status"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genre_musicians", force: :cascade do |t|
    t.integer "genre_id"
    t.integer "musician_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instrument_musicians", force: :cascade do |t|
    t.integer "musician_id"
    t.integer "instrument_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "musicians", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "bio"
    t.string "availabiity"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "openings", force: :cascade do |t|
    t.integer "band_id"
    t.integer "instrument_id"
    t.string "commitment"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer "musician_id"
    t.integer "opening_id"
    t.string "message"
    t.string "musician_status"
    t.string "band_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
