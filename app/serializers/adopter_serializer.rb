class AdopterSerializer < ActiveModel::Serializer
	attributes :name, :thumbnail, :state, :city
end