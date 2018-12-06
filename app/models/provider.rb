class Provider < ApplicationRecord
  belongs_to :user

  validates_presence_of :name
  validates :name, uniqueness: {scope: :user_id}
end
