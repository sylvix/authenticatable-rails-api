class ApiKeySerializer < ActiveModel::Serializer
  attributes :id, :access_token
  has_one :user, serializer: UserOnlyIdSerializer
end