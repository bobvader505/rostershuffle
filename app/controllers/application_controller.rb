class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authenticate_user!
	layout 'application'
	before_filter :set_constants

	def set_constants
	    @games = Game.where(:active =>  true)
	end
end
