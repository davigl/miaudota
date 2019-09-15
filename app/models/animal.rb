class Animal < ApplicationRecord
	has_one_attached :image

	validates :breed, :name, :specie, presence: true

  belongs_to :shelter
end
