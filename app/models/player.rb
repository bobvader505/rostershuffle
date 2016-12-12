class Player < ApplicationRecord
	attr_accessor :role
	has_many :transactions
end
