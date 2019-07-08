class Account < ApplicationRecord

	validates :name, :balance, presence: true
	# validates :balance, numerically: true

	belongs_to :user
	has_many :transactions, :dependent => :destroy

	def get_balance
		balance = 0
		self.transactions.each do |transaction|
			if transaction.action == "Withdrawl"
				balance = balance - transaction.amount
			else
				balance = balance + transaction.amount
			end
		end
		balance
	end

end
