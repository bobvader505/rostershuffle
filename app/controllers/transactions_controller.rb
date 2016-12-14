class TransactionsController < ApplicationController
	def show
		@transaction = Transaction.find(params[:id])
	end

	def tweet
		transaction = Transaction.find(params[:id])
		client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "9PnasnyFifX9escVyjfUTwOOZ"
		  config.consumer_secret     = "IHFXWF0CinL7A6zAe8KWyc8yY12UgrcaZuOS9KlqhxnfRC80Gl"
		  config.access_token        = "808756177320361984-4DUbwDJnPYnFSf55fOTakNo1jxiSaMz"
		  config.access_token_secret = "mKhlDRk8SaEI3QaKBaoUXPSQ7XFHpa8Bis5FxBk3xpmLR"
		end
		client.update(transaction.player.name + " has " + transaction.transtype.verb + " " + transaction.team.name + ". www.rostershuffle.io #RosterShuffle")
		redirect_to '/admin/transaction/' + transaction.id.to_s
	end
end
