class ArtworkShare < ApplicationRecord
  validates :viewer_id, uniqueness: { scope: :artwork_id, message: "shared artwork cant have same viewer" }, presence: true

  belongs_to :viewer,
    foreign_key: :viewer_id,
    class_name: :User
    # dependent: :destroy

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork
    # dependent: :destroy

end