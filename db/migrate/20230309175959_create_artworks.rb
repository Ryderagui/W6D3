class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title, null:false
      t.string :image_url, null:false, unique: true
      t.references :artist, null:false
      t.timestamps
    end
    add_index :artworks, [:artist_id,:title], unique:true 
    add_foreign_key :artworks, :users, column: :artist_id, primary_key: 'id'
  end
end
