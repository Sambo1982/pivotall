class PivotalAccountsController < ApplicationController

	def new
		@user = current_user
		@pivotal_account = PivotalAccount.new
	end

	def destroy
	end

end
