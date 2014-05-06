class School < ActiveRecord::Base
	has_many :lnk_school_courses
	accepts_nested_attributes_for :lnk_school_courses, :reject_if => :all_blank, :allow_destroy => true
end
