class Provider < ApplicationRecord
  belongs_to :user
  has_many :pixels, dependent: :destroy

  validates_presence_of :name
  validates :name, uniqueness: {scope: :user_id}
end
