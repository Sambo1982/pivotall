class Project < ActiveRecord::Base
	belongs_to :pivotal_account
	validates_uniqueness_of :external_id
	
end
