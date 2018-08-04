class ResidenceDuration < ActiveRecord::Base
	self.inheritance_column = nil
	belongs_to :residence
end
