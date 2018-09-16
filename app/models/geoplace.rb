class Geoplace < ApplicationRecord
	has_many :lnk_school_geoplaces
	belongs_to :geoplace_type
end
