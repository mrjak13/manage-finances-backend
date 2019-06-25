class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :accounts
  # has_many :accounts
end
