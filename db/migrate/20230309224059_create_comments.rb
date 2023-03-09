class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body, null:false
      t.references :author, null:false
      t.references :artwork, null:false

      t.timestamps
    end
    add_foreign_key :comments, :users, column: :author_id, primary_key: 'id'
    add_foreign_key :comments, :artworks, column: :artwork_id, primary_key: 'id'
  end
end
