class ReportsController < ApplicationController
	def show
		@report = Report.find(params[:id])
		@image_attachement = @report.image_attachements.all
		@tasks_today =  @report.tasks.find(:all, :conditions => ["task_type = 'Today' "])
		@tasks_tomorrow =  @report.tasks.find(:all, :conditions => ["task_type = 'Tomorrow' "])
	end

	def edit
		@report = Report.find(params[:id])
		@image_attachement = @report.image_attachements.all
	end

	def new
		@site = Site.find(params[:site_id])
    	@report = @site.reports.build
    	@image_attachement = @report.image_attachements.build
	end

	def create
		@site = Site.find(params[:site_id])
	    @report = @site.reports.build(report_params)
	    if @report.save
	    	if params[:image_attachements] != nil
	       		params[:image_attachements]['image'].each do |a|
	          	@image_attachement = @report.image_attachements.create!(:image => a, :report_id => @report.id)
	       		end
	   		end
	  	end
	   
	    redirect_to project_site_report_path(@site.project.id,@site.id,@report.id)

	end

	def update_report
		@report = Report.find(params[:id])
		@report.update(report_params)
		if params[:image_attachements] != nil
	       params[:image_attachements]['image'].each do |a|
	          @image_attachment = @report.image_attachements.create!(:image => a, :report_id => @report.id)
	       end
	   end
	   @report.save

		redirect_to project_site_report_path(@report.site.project.id,@report.site.id,@report.id)
	end

	def delete_image
		@report = Report.find(params[:report_id])
		@image = ImageAttachement.find(params[:id])
		@image.destroy!
		redirect_to edit_project_site_report_path(@report.site.project.id,@report.site.id,@report.id)
	end

	# def delete_task
	# 	@task = Tasks.find(params[:id])	
	# 	@task.destroy

	# 	redirect_to dashboards_path	
	# end


	private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

       def report_params
         params.require(:report).permit(:report_type,:summary, :effciency, :project_start_condition,
                 :todays_condition, :controls_in_place, :materials, :material ,:safety_meeting, :safety_doc, :image)
       end
end
