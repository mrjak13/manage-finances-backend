class ChangeBalanceToFloatInAccounts < ActiveRecord::Migration[5.2]
  def change
  	change_column :accounts, :balance, :float
  end
end
