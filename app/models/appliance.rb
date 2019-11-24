class Appliance < ApplicationRecord
  belongs_to :animal
  belongs_to :adopter
  has_one :adoption
end
