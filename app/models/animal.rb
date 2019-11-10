# frozen_string_literal: true

class Animal < ApplicationRecord
  validates :name, :specie, :castrated, :gender, :avatar, presence: true
  paginates_per 10

  belongs_to :shelter
end
