class OthersController < ApplicationController
	def index
		@languages = Language.all
	end
end
