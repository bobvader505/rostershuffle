class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  
  def index
  	@teams = Team.all.order("name")
  	@transactions = Transaction.limit(5).order("date desc")
  	@teams.each do |team|
		roster = Array.new
		team.transactions.each do |transaction|
			if transaction.transtype.name == "Join"
				transaction.player.role = transaction.role
				roster.push(transaction.player)
			end
			if transaction.transtype.name == "Leave"
				if roster.include?(transaction.player)
					roster.delete_at(roster.index(transaction.player))
				end
			end
		end
		team.roster = roster
  	end
  end
end
