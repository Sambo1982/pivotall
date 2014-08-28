class PivotalAccount < ActiveRecord::Base
	belongs_to :user
	has_many :projects, dependent: :destroy
	validates_uniqueness_of :api_key, scope: :user_id

end
