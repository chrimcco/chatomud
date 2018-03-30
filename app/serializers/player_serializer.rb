class PlayerSerializer < ActiveModel::Serializer
  attributes :username, :authentication_token
end
