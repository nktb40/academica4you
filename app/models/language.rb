class Language < ActiveRecord::Base
	has_many :lang_levels
  	accepts_nested_attributes_for :lang_levels, :reject_if => :all_blank, :allow_destroy => true
end
