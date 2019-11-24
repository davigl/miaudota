class Questionnarie < ApplicationRecord
  belongs_to :adopter, dependent: :destroy

  validates :home, :family, :pets, presence: true
end
