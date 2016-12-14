class Team < ApplicationRecord
	attr_accessor :roster
	has_many :transactions
	belongs_to :regions
end
