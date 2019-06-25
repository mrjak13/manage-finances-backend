class TransactionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :amount, :action, :date
end
