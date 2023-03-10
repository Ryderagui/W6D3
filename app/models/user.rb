# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    has_many :owned_art,
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependent: :destroy,
        inverse_of: :artist

    has_many :viewers,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_artworks,
        through: :viewers,
        source: :artwork

    has_many :comments,
        foreign_key: :author_id,
        class_name: :Comment,
        dependent: :destroy,
        inverse_of: :author 

    has_many :likes,
        foreign_key: :author_id,
        class_name: :Like,
        dependent: :destroy,
        inverse_of: :author

    has_many :liked,
        through: :likes,
        source: :likable

        
end
