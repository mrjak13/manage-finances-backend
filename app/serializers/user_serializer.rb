class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :accounts
end
