class GamesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:show]

  def show

  	curr_game = Game.find_by_slug(params[:game_slug])
  	@curr_region = Region.where("game_id = " + curr_game.id.to_s + " AND slug = '" + params[:region_slug] + "'").first
  	@teams = Team.where("region_id = " + @curr_region.id.to_s).order("name")
  	@transactions = Transaction.limit(5).order("date desc")
  	@teams.each do |team|
		roster = Array.new
		team.transactions.order("date asc").each do |transaction|
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
		team.roster = roster.sort_by {|player| player.role.order}
  	end
  end
end
