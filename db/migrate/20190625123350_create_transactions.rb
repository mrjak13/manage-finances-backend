class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :name
      t.string :action
      t.date :date
      t.integer :amount
      t.integer :account_id

      t.timestamps
    end
  end
end
