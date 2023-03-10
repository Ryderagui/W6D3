# == Schema Information
#
# Table name: likes
#
#  id           :bigint           not null, primary key
#  likable_type :string
#  likable_id   :bigint
#  author_id    :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Like < ApplicationRecord

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    belongs_to :likable,
        polymorphic: true

end
