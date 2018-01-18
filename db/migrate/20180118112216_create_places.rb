class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
    	t.string   "title"
    	t.string   "difficulty"
    	t.string   "time"
    	t.float    "distance"
    	t.text     "description"
    	t.text     "directions"
    	t.text     "terrain",     default: [],              array: true
    	t.integer  "user_id"
    	t.index ["user_id"], name: "index_places_on_user_id", using: :btree
      t.timestamps
    end
  end
end
