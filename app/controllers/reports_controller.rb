class ReportsController < ApplicationController
	def show
		@report = Report.find(params[:id])
	end

	def edit
		@report = Report.find(params[:id])
	end

	def new
		@site = Site.find(params[:site_id])
    	@report = @site.reports.build
	end

	def create
		@site = Site.find(params[:site_id])
	    @report = @site.reports.build
	    @report.report_type = params[:report_type]
	    @report.summary = params[:summary]
	    @report.effciency = params[:effciency]
	    @report.project_start_condition = params[:project_start_condition]
	    @report.todays_condition = params[:todays_condition]
	    @report.materials = params[:materials]
	    @report.safety_meeting = params[:safety_meeting]
	    @report.image = File.new(params[:image])
	    @report.save
	    redirect_to project_site_report_path(@site.project.id,@site.id,@report.id)

	end

	def update

	end
end
