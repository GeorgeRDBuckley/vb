class CreateBeerLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :beer_likes do |t|
      t.integer :user_id
      t.integer :beer_id

      t.timestamps
    end
    add_index :beer_likes, :user_id
    add_index :beer_likes, :beer_id
    add_index :beer_likes, [:user_id, :beer_id], unique: true
  end
end
