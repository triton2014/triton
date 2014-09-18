class ProjectsController < ApplicationController
  def new
    @project = Project.new

  end

  def edit
    @project = Project.find(params[:id])
  end

  def show
    @project = Project.find(params[:id])
    @users_for_project = @project.users.find(:all, :conditions => ["role = 'Customer'"])
  end

  def create
    @project = Project.new(project_params)
    @project.users<<current_user
    @project.save
    redirect_to @project
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    
    redirect_to @project
  end

  def new_site
    @project = Project.find(params[:id])
    @site = @project.sites.build
  end

  private
      
    def project_params
      params.require(:project).permit(:name, :start_date, :estimated_end_date, :manager_id)
    end

end
