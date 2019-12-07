# frozen_string_literal: true

class QuestionnarieSerializer < ActiveModel::Serializer
  attributes :home, :family, :pets
end
