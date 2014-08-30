class PivotalAccountsController < ApplicationController
	before_action :set_account, only: [:show, :destroy]

	def index
		@user = current_user
		@pivotal_accounts = @user.pivotal_accounts.all
		@projects = Project.all
	end
	
	def new
		@pivotal_account = PivotalAccount.new
	end

	def create	
		@user = current_user
		@pivotal_account = @user.pivotal_accounts.build(pivotal_params)
		respond_to do |format|
		  if @pivotal_account.save
		  	set_token
		  	create_projects
		    format.html { redirect_to pivotal_accounts_path, notice: 'Pivotal Tracker account was successfully created.' }
		    format.json { render action: 'show', status: :created, location: @pivotal_account }
		  else
		    format.html { render action: 'new' }
		    format.json { render json: @pivotal_account.errors, status: :unprocessable_entity }
		  end
		end
	end


	def destroy
		@pivotal_account.destroy
		respond_to do |format|
			format.html { redirect_to pivotal_accounts_path }
	      	format.json { head :no_content }
	    end
	end

private

    def set_account
      @pivotal_account = PivotalAccount.find(params[:id])
    end

    def pivotal_params
      params.require(:pivotal_account).permit(:user_id, :api_key)
    end

    def project_params
      params.require(:project).permit(:name, :external_id)
    end

    def create_projects
    	@projects = PivotalTracker::Project.all
    	@projects.each do |project|
  			@project = @pivotal_account.projects.create(:name => project.name, :external_id => project.id)
		end
    end

    def create_stories
    	project = Project.where(:subscribe=>true)
    	project.each do |project|
    		a_project = PivotalTracker::Project.find(project)                        
			stories = a_project.stories.all  
			stories.each do |story|
				story = project.stories.create(:name => story.name, :external_id => story.id)
			end
		end
    end



end
