class Account < ApplicationRecord

	validates :name, :balance, presence: true
	validates :balance, numerically: true

	belongs_to :user
	has_many :transactions
end
