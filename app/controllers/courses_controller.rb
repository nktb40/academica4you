class CoursesController < ApplicationController
	def index
		@courses = Course.all
	end 
	
	def new
		@course = Course.new
		@languages = Language.all
		@levels = []
		@schools = School.all
	end 
	
	def create
		@course = Course.new(course_params)		
		if(@course.save)
			logger.info "saving course success"
		else
			logger.info "error when saving course"
		end
		redirect_to courses_path
	end
	
	def edit
    	@course = Course.find(params[:id])
    	@languages = Language.all
    	@schools = School.all
    	@levels = LangLevel.where(:language_id=>@course.language_id).order(:name) unless params[:id].blank?
  	end
  	
  	def update
    @course = Course.find(params[:id])
      if @course.update_attributes(course_params)
        logger.info "updating course success"
      else
        logger.info "error when updating course"
      end
      redirect_to courses_path
  	end
  	
  	def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
   end
	
	def update_level_select
    @levels = LangLevel.where(:language_id=>params[:id]).order(:name) unless params[:id].blank?
	end
	
	private
	def lang_level_params
		params.require(:lang_level).permit(:name, :description, :language_id)
	end

	private 
 	def course_params 
  		params.require(:course).permit(:name, :description, :language_id, :level_id, :minimum_age, 
  						course_durations_attributes: [:id, :course_id, :duration, :type, :price, :currency_id, :_destroy],
  						lnk_school_courses_attributes: [:id, :school_id, :course_id, :_destroy]) 
 	end 
end
