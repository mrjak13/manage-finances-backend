# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# justin = User.create(name: "Justin Kenney", email:"jk@jk.com", password: "password")

# savings = Account.create(name: "Savings", balance: 0, user_id: justin.id)

# checking = Account.create(name: "Checking", balance: 0, user_id: justin.id)

savings = Account.first

checking = Account.last

Transaction.create(name: "Deposit", account_id: checking.id, action: "increase", date: Time.now, amount: 1000)

Transaction.create(name: "Deposit", account_id: savings.id, action: "increase", date: Time.now, amount: 1500)

Transaction.create(name: "Withdraw", account_id: savings.id, action: "decrease", date: Time.now, amount: 1500)




