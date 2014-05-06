class AddressesController < ApplicationController

	def index
		@addresses = Address.all
	end
	
	def new
		@address = Address.new
	end 
	
	def create
		@address = Address.new(address_params)		
		if(@address.save)
			logger.info "saving address success"
		else
			logger.info "error when saving address"
		end
	end
	
	def edit
    	@address = Address.find(params[:id])
  	end
  	
  	def update
    @address = Address.find(params[:id])
      if @address.update_attributes(address_params)
        logger.info "updating address success"
      else
        logger.info "error when updating address"
      end
  	end
  	
  	def destroy
     @address = Address.find(params[:id])
     @address.destroy
   end
	
	private 
 	def address_params 
  		params.require(:address).permit(:world_part, :country, :region, :city, :street, :house, :latitude, :longitude)  
 	end 
end
