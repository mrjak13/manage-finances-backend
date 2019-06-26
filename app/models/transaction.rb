class Transaction < ApplicationRecord

	validates :name, :amount, :action, :date, presence: true
	validates :action, inclusion: { in: %w(increase decrease).
		message: "%{value} is not a valid action"}

	belongs_to :account
end
