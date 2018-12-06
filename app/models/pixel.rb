class Pixel < ApplicationRecord
  belongs_to :provider
  has_many :conversions

  validates_presence_of :name
  validates :name, uniqueness: {scope: :provider_id}
end
