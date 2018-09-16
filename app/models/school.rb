class School < ActiveRecord::Base
   has_many :lnk_school_courses
   has_many :lnk_school_geoplaces
   accepts_nested_attributes_for :lnk_school_courses, :reject_if => :all_blank, :allow_destroy => true

   belongs_to :company
   
   searchkick text_middle: [:full_address_eng, :name], locations: [:location]
   #searchkick locations: [:location]

   #geocoded_by address: :full_address_eng

   # the callback to set longitude and latitude
   #after_validation :geocode

   def search_data
    attributes.merge(location: {lat: latitude, lon: longitude})
  end
end
