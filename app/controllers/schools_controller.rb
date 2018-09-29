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

		#ip = nil
		#if Rails.env.production?
		#  ip = request.remote_ip
		#else
		#  ip = Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
		#end

		#result = Geocoder.search(ip).first

		#puts result.to_json

		#@southWest = [result.bounds[0], result.bounds[1]]
	    #@northEast = [result.bounds[2], result.bounds[3]]
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
        @res_places = Geocoder.search(params[:term], params: {language: lang}).first(5)
		
		@sugest_results = @res_places.map(&:formatted_address)

		puts @sugest_results.empty?

        if !@sugest_results.empty?
	        #puts @res_places.map(&:formatted_address)
	        #puts @res_places.map(&:short_name)
	        sw_lat = nil
	        sw_lon = nil
	        ne_lat = nil
	        ne_lon = nil

	        @res_places.each do |place|
	        	if sw_lat.nil?
		       		sw_lat = place.bounds[0]
			        sw_lon = place.bounds[1]
			        ne_lat = place.bounds[2]
			        ne_lon = place.bounds[3]
			    else
			    	sw_lat = [sw_lat, place.bounds[0]].max
			        sw_lon = [sw_lon, place.bounds[1]].min
			        ne_lat = [ne_lat, place.bounds[2]].min
			        ne_lon = [ne_lon, place.bounds[3]].max
			    end
	        end

	        @southWest = [sw_lat, sw_lon]
	        @northEast = [ne_lat, ne_lon]

        	@hash = Gmaps4rails.build_markers(@res_places) do |place, marker|
				marker.lat place.latitude
				marker.lng place.longitude
				marker.infowindow place.address
			end
        	render :action => 'autocomplete'
        end
      end
   end

   def get_addr_by_pos
   		if params[:map_pos].present?
   			puts params[:map_pos]
   			@addr_res = Geocoder.search(params[:map_pos]).first
   			puts @addr_res.formatted_address
   			render :action => 'get_addr_by_pos'
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
