class AccountSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :balance, :transactions
end
