# frozen_string_literal: true

class Adoption < ApplicationRecord
  belongs_to :adopter
  belongs_to :appliance
end
