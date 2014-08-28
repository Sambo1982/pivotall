class ProjectsController < ApplicationController

 def edit
   @project = Project.find(params[:id])
 end

 def update
 	@project = Project.find(params[:id])
	respond_to do |format|
      if @project.update(project_params)
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

end
