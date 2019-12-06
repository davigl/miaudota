# frozen_string_literal: true

class Appliance < ApplicationRecord
  belongs_to :animal
  belongs_to :adopter
  belongs_to :shelter
  has_one :adoption
  paginates_per 10

  enum status: { analyzing: 0, accepted: 1, rejected: 2 }
end
