class TeamsController < ApplicationController

	def show
		@team = Team.find(params[:id])
	end

	def calculate_current_team
		team = Team.find(params[:id])
		roster = Array.new
		team.transactions.each do |transaction|
			if transaction.transtype.name == "Join"
				roster.push(transaction.player)
			end
			if transaction.transtype.name == "Leave"
				if roster.include?(transaction.player)
					roster.delete_at(roster.index(transaction.player))
				end
			end
		end
		@roster = roster
	end
end
