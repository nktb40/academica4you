class ResidencesController < ApplicationController
	def index
		@residences = Residence.all
	end 
	
	def new
		@residence = Residence.new
		@schools = School.all.order(:name)
	end 
	
	def create
		@residence = Residence.new(residence_params)		
		if(@residence.save)
			logger.info "saving residence success"
		else
			logger.info "error when saving residence"
		end
		redirect_to residences_path
	end
	
	def edit
    	@residence = Residence.find(params[:id])
    	@schools = School.all.order(:name)
  	end
  	
  	def update
    @residence = Residence.find(params[:id])
      if @residence.update_attributes(residence_params)
        logger.info "updating residence success"
      else
        logger.info "error when updating residence"
      end
      redirect_to residences_path
  	end
  	
  	def destroy
    @residence = Residence.find(params[:id])
    @residence.destroy
    redirect_to residences_path
  end
	
	private 
 	def residence_params 
  		params.require(:residence).permit(:name, :description, :type, :school_id, 
  													residence_durations_attributes: 
  													[:id, :duration, :type, :price, :currency_id, :_destroy],
  													residence_features_attributes: 
  													[:id, :name, :description, :price, :currency_id, :_destroy]) 
 	end 
end
