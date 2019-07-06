class ChangeAmountToBeFloatInTransactions < ActiveRecord::Migration[5.2]
  def change
  	change_column :transactions, :amount, :float
  end
end
