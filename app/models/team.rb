class Team < ApplicationRecord
	attr_accessor :roster
	has_many :transactions
end
