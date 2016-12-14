class RegionsController < ApplicationController
  def show
  	@curr_region = Region.find_by_slug(params[:slug])
  	@regions = Region.all
  	@teams = Team.where("region_id = " + @curr_region.id.to_s).order("name")
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
		team.roster = roster.sort_by {|player| player.role.order}
  	end
  end
end
