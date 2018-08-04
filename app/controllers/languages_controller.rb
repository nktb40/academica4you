class LanguagesController < ApplicationController

	def index
		@languages = Language.all
	end 
	
	def new
		@language = Language.new
	end 
	
	def create
		@language = Language.new(language_params)		
		if(@language.save)
			logger.info "saving language success"
		else
			logger.info "error when language course"
		end
		redirect_to others_path
	end
	
	def edit
    	@language = Language.find(params[:id])
  	end
  	
  	def update
    @language = Language.find(params[:id])
      if @language.update_attributes(language_params)
        logger.info "updating language success"
      else
        logger.info "error when updating language"
      end
      redirect_to others_path
  	end
  	
  	def destroy
    @language = Language.find(params[:id])
    @language.destroy
    redirect_to others_path
  end
	
	private 
 	def language_params 
  		params.require(:language).permit(:eng_name, :rus_name, :original_name, lang_levels_attributes: 
  													[:id, :language_level, :name, :description, :_destroy]) 
 	end 
end
