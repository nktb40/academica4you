class Residence < ActiveRecord::Base
self.inheritance_column = nil
has_many :residence_durations
has_many :residence_features
  	accepts_nested_attributes_for :residence_durations, :reject_if => :all_blank, :allow_destroy => true
  	accepts_nested_attributes_for :residence_features, :reject_if => :all_blank, :allow_destroy => true
end
