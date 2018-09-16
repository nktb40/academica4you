class CompaniesController < ApplicationController
	def index
		@companies = Company.all
	end 
	
	def new
		@company = Company.new
	end 
	
	def create
		@company = Company.new(company_params)		
		if(@company.save)
			logger.info "saving company success"
		else
			logger.info "error when saving company"
		end
		redirect_to companies_path
	end
	
	def edit
    	@company = Company.find(params[:id])
  	end
  	
  	def update
    @company = Company.find(params[:id])
      if @company.update_attributes(company_params)
        logger.info "updating company success"
      else
        logger.info "error when updating company"
      end
      redirect_to companies_path
  	end
  	
  	def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path
  end
	
	private 
 	def company_params 
  		params.require(:company).permit(:name, :description, :logo) 
 	end 
end
