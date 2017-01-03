class GamesController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:show]

  def show
  	if params[:game_slug] == ""
		config = ShuffleConfig.first()
		game_slug = config.game;
		region_slug = config.region;
	else
		game_slug = params[:game_slug]
		region_slug = params[:region_slug]
	end

  	curr_game = Game.find_by_slug(game_slug)
  	@curr_region = Region.where("game_id = " + curr_game.id.to_s + " AND slug = '" + region_slug + "'").first
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


  def admin_show
  	@games = Game.all
  end
end
