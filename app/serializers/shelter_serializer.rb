class ShelterSerializer < ActiveModel::Serializer
	attributes :name

	has_many :animals
end