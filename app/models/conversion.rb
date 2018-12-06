class Conversion < ApplicationRecord
  belongs_to :pixel

  validates :pixel_id, uniqueness: {scope: [:ip,:user_agent]}
end
