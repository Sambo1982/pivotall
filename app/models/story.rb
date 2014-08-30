class Story < ActiveRecord::Base
	belongs_to :project
	validates_uniqueness_of :external_id
	
end
