class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
    	t.string :title
    	t.string :difficulty
    	t.string :terrain
    	t.float :time
    	t.float :distance
    	t.text :description
    	t.text :directions
    	t.boolean :free_parking
    	t.text :where_to_park
      t.timestamps
    end
  end
end
