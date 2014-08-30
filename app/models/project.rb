class Project < ActiveRecord::Base
	belongs_to :pivotal_account
	has_many :stories
	validates_uniqueness_of :external_id
	
end
