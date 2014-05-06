class Course < ActiveRecord::Base
	has_many :course_durations
	has_many :lnk_school_courses
  	accepts_nested_attributes_for :course_durations, :reject_if => :all_blank, :allow_destroy => true
  	accepts_nested_attributes_for :lnk_school_courses, :reject_if => :all_blank, :allow_destroy => true
end
