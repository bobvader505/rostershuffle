class Region < ApplicationRecord
	has_many :teams
	belongs_to :game
end
