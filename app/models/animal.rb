# frozen_string_literal: true

class Animal < ApplicationRecord
	mount_uploader :avatar, AvatarUploader

  validates :breed, :name, :specie, presence: true

  belongs_to :shelter
end
