# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord 
    validates :title, presence: true, uniqueness: { scope: :artist_id}
    validates :image_url, presence: true, uniqueness: true

    def self.artworks_for_user_id(user_id)
        Artwork.select(:id, :title, :image_url).left_joins(:shared_viewers).where("users.id = #{user_id} OR artist_id = #{user_id}")
        # Artwork.select(:id, :title, :image_url).where("artist_id = user_id")
    end

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :shared_artwork,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_viewers,
        through: :shared_artwork,
        source: :viewer

    has_many :comments,
        foreign_key: :artwork_id,
        class_name: :Comment,
        dependent: :destroy,
        inverse_of: :artwork

    has_many :likes,
        as: :likable,
        dependent: :destroy
        

    has_many :likers,
        through: :likes,
        source: :author
   

end
