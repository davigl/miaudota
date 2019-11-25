class Appliance < ApplicationRecord
  belongs_to :animal
  belongs_to :adopter
  belongs_to :shelter
  has_one :adoption
  paginates_per 10
end
