class SchoolsController < ApplicationController
	def index
		if params[:location].present?
		   bounds = Geocoder.search(params[:location]).first.bounds
		   #puts bounds
		   if bounds.present?
	 	      @schools = School.search "*", where: {location: {top_left: {lat: bounds[2], lon: bounds[1]}, bottom_right: {lat: bounds[0], lon: bounds[3]}}}
		   else
		      @schools = []
		   end
		   #puts @schools.to_json
		else
		   @schools = School.all
		end
		@hash = Gmaps4rails.build_markers(@schools) do |school, marker|
			  marker.lat school.latitude
			  marker.lng school.longitude
		end
	end
	
	def new
		@school = School.new
		@companies = Company.all
		@courses = Course.all
		@schools = School.all
	end 
	
	def create
		@school = School.new(school_params)		
		if(@school.save)
			logger.info "saving school success"
		else
			logger.info "error when saving school"
		end
		redirect_to schools_path
	end
	
	def edit
    	@school = School.find(params[:id])
    	@companies = Company.all
    	@courses = Course.all
  	end
  	
  	def update
	    @school = School.find(params[:id])
	      if @school.update_attributes(school_params)
		logger.info "updating school success"
	      else
		logger.info "error when updating school"
	      end
	      redirect_to schools_path
  	end
  	
  	def destroy
		@school = School.find(params[:id])
		@school.destroy
		redirect_to schools_path
   end
   
   #def search	
   #end

   def autocomplete
      if params[:term].present?
      	lang =  DetectLanguage.simple_detect(params[:term])
        res = Geocoder.search(params[:term], params: {language: lang}).first(5)
		@sugest_results = res.map(&:formatted_address)
        #render json: res.map(&:formatted_address).to_json
        if !@sugest_results.empty?
        	render :action => 'autocomplete'
        end
      end
   end
	
   private 
   def school_params 
		params.require(:school).permit(
			:name, 
			:description, 
			:company_id, 
			:world_part, 
			:country, 
			:city, 
			:street, 
			:house, 
			:latitude, 
			:longitude,
			lnk_school_courses_attributes: [:id, :school_id, :course_id, :_destroy]
		)  
   end 
end
