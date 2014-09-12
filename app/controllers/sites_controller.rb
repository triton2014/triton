class SitesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @site = @project.sites.build
  end

  def create
    @project = Project.find(params[:project_id])
    @site = @project.sites.build
    @site.name = params[:name]
    @site.save
    redirect_to "/projects/#{:project_id}/sites/#{@site.id}"
  end

  def show
  	@site = Site.find(params[:id])
  	@sites_project = @site.project.sites
  	@reports_tristatus = @site.reports.find(:all ,:conditions => ["report_type = 'tristatus'"])
	@reports_triharder = @site.reports.find(:all ,:conditions => ["report_type = 'triharder'"])
  
  end


   
end
