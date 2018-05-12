class UserSerializer < ActiveModel::Serializer
  attributes    :created_at, :updated_at
  attributes    :id, :email, :first_name, :last_name, :roles_mask, :roles
end
