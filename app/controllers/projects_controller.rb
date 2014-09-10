class ProjectsController < ApplicationController
  def new
  	@project = Project.new

  end

  def edit
  	@project = Project.find(params[:id])
  end

  def show
  	@project = Project.find(params[:id])
  end

  def create
  	@project = Project.new(project_params)
  	@project.save
  	redirect_to @project
  end

  def update
  	@project = Project.find(params[:id])
  	@project.update(project_params)
  	
  	redirect_to @project
  end

  private
      
    def project_params
      params.require(:project).permit(:name, :status, :start_date, :end_date, :security_alert, :manager_id)
    end

end
