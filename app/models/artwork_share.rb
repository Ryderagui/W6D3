# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :bigint           not null
#  viewer_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord
    validates :artwork_id, presence: true, uniqueness: { scope: :viewer_id}
    validates :viewer_id, presence: true

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork
        
    belongs_to :viewer,
        foreign_key: :viewer_id,
        class_name: :User
end

# validates :title, presence: true, uniqueness: { scope: :artist_id}
#     validates :image_url, presence: true, uniqueness: true
