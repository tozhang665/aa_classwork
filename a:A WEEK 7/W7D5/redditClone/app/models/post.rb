class Post < ApplicationRecord

    validates :title, :sub_id, :user_id, presence: true

    belongs_to :sub,
        primary_key: :id,
        foreign_key: :sub_id,
        class_name: :Sub

    belongs_to :user,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
end
