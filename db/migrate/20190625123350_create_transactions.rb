class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :name
      t.date :date
      t.integer :amount
      t.string :type

      t.timestamps
    end
  end
end
