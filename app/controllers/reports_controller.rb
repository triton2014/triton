class ReportsController < ApplicationController
	def show
		@report = Report.find(params[:id])
		@tasks_today =  @report.tasks.find(:all, :conditions => ["task_type = 'Today' "])
		@tasks_tomorrow =  @report.tasks.find(:all, :conditions => ["task_type = 'Tomorrow' "])
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
	    @report = @site.reports.build(report_params)
	    # @report.report_type = params[:report_type]
	    # @report.summary = params[:summary]
	    # @report.effciency = params[:effciency]
	    # @report.controls_in_place = params[:controls_in_place]
	    # @report.project_start_condition = params[:project_start_condition]
	    # @report.todays_condition = params[:todays_condition]
	    # @report.materials = params[:materials]
	    # @report.safety_meeting = params[:safety_meeting]
	    # @report.image = params[:image]
	    @report.save
	    redirect_to project_site_report_path(@site.project.id,@site.id,@report.id)

	end

	def update

	end


	private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

       def report_params
         params.require(:report).permit(:report_type,:summary, :effciency, :project_start_condition,
                 :todays_condition, :controls_in_place, :materials, :safety_meeting, :image)
       end
end
