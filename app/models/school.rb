class School < ActiveRecord::Base
	has_many :lnk_school_courses
	accepts_nested_attributes_for :lnk_school_courses, :reject_if => :all_blank, :allow_destroy => true

   belongs_to :company   
   
   # full_address is a method which take some model's attributes to get a formatted address for example
 	geocoded_by :full_address 

   # the callback to set longitude and latitude
   after_validation :geocode

   # the full_address method
   def full_address
     #"#{address}, #{zipcode}, #{city}, #{country}"
   end
end
