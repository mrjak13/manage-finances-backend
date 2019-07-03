class User < ApplicationRecord
	has_secure_password

	validates :name, :email, presence: true
	validates :email, uniqueness: true

	has_many :accounts
	has_many :transactions, through: :accounts
end
