class ProjectsController < ApplicationController

 def edit
   @project = Project.find(params[:id])
 end

 def update
 	@project = Project.find(params[:id])
	respond_to do |format|
      if @project.update(project_params)
        create_stories
        format.html { redirect_to pivotal_accounts_path, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def project_params
    params.require(:project).permit(:name, :subscribe, :external_id)
	end

  def create_stories
      if @project.subscribe == true
        set_token
        a_project = PivotalTracker::Project.find(@project.external_id)                        
        stories = a_project.stories.all  
        stories.each do |story|
          story = @project.stories.create(:name => story.name, :external_id => story.id)
        end
      end
    end

end
