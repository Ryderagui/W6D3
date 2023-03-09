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
        dependent: :destroy
end
