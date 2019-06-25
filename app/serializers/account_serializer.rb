class AccountSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :balance
  belongs_to :user
end
