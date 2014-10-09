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
    redirect_to "/projects/#{@project.id}/sites/#{@site.id}"
  end

  def show
  	@site = Site.find(params[:id])
  	@sites_project = @site.project.sites
  	@reports_tristatus = @site.reports.find(:all ,:conditions => ["report_type = 'tristatus'"])
	  @reports_triharder = @site.reports.find(:all ,:conditions => ["report_type = 'triharder'"])
  
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update_site
    @site = Site.find(params[:id])
    @site.name = params[:name]
    @site.save
    redirect_to project_site_path(@site.project.id, @site.id)

  end

  def delete_site
    @site = Site.find(params[:id])
    @project = @site.project
    @site.destroy
    redirect_to project_path(id: @project.id)   
  end

  def delete_report
    @report= Report.find(params[:id])
    @site = @report.site
    @report.destroy
    redirect_to project_site_path(id: @site.id)
    
  end


   
end
