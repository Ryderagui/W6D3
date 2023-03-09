# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Artwork.destroy_all
User.destroy_all
User.create!(name: "Ryder")
User.create!(name: "Josh")
Artwork.create!(title: "Starry Night", image_url: ";lad;lsd;f", artist_id: User.where("name = 'Josh'").pluck(:id).first)
Artwork.create!(title: "A Big, Good, Art", image_url: "kla;jsdflasfj", artist_id: User.where("name = 'Ryder'").pluck(:id).first)
ArtworkShare.create!(viewer_id: User.where("name = 'Ryder'").pluck(:id).first, artwork_id: Artwork.where("title = 'Starry Night'").pluck(:id).first)