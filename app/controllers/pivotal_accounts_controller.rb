class PivotalAccountsController < ApplicationController

	def new
		@pivotal_account = PivotalAccount.new
	end

	def create	
		@user = current_user
		@pivotal_account = @user.pivotal_accounts.build(pivotal_params)
		respond_to do |format|
		  if @pivotal_account.save
		    format.html { redirect_to root_path, notice: 'Pivotal Tracker account was successfully created.' }
		    format.json { render action: 'show', status: :created, location: @pivotal_account }
		  else
		    format.html { render action: 'new' }
		    format.json { render json: @pivotal_account.errors, status: :unprocessable_entity }
		  end
		end
	end


	def destroy
	end

private

    def pivotal_params
      params.require(:pivotal_account).permit(:user_id, :api_key)
    end

end
