class ReportsController < ApplicationController
	def show
		@report = Report.find(params[:id])
		@image_attachement = @report.image_attachements.all
		@material_attachment = @report.material_attachements.all
		@tasks_today =  @report.tasks.find(:all, :conditions => ["task_type = 'Today' "])
		@tasks_tomorrow =  @report.tasks.find(:all, :conditions => ["task_type = 'Tomorrow' "])
	end

	def edit
		@report = Report.find(params[:id])
		@image_attachement = @report.image_attachements.all
		@material_attachment = @report.material_attachements.all
	end

	def new
		@site = Site.find(params[:site_id])
    	@report = @site.reports.build
    	@image_attachement = @report.image_attachements.build
    	@material_attachment = @report.material_attachements.build
	end

	def create
		@site = Site.find(params[:site_id])
	    @report = @site.reports.build(report_params)
	    
	    
	    if @report.save
	    	if params[:image_attachements] != nil
	       		params[:image_attachements]['image'].each do |a|
	       		# Cloudinary::Uploader.upload(a)
	          	@image_attachement = @report.image_attachements.create!(:image => a, :report_id => @report.id)
	       		end
	   		end
	   		if params[:material_attachements] != nil
	       		params[:material_attachements]['material_image'].each do |b|
	       		#Cloudinary::Uploader.upload(b)
			  @material_attachment = @report.material_attachements.create!(:material_image => b, :report_id => @report.id)
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
	       	#Cloudinary::Uploader.upload(a)
	          @image_attachment = @report.image_attachements.create!(:image => a, :report_id => @report.id)
	        end
	   end

	   if params[:material_attachements] != nil
		  params[:material_attachements]['material_image'].each do |b|
			#Cloudinary::Uploader.upload(b)
			  @material_attachment = @report.material_attachements.create!(:material_image => b, :report_id => @report.id)
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

	def delete_material_image
		@report = Report.find(params[:report_id])
		@material_image = MaterialAttachement.find(params[:id])
		@material_image.destroy
		redirect_to edit_project_site_report_path(@report.site.project.id,@report.site.id,@report.id)
	end

	def delete_task
		@task= Task.find(params[:id])
	    @report = @task.report
	    @task.destroy
		 redirect_to project_site_report_path(@report.site.project.id,@report.site.id,@report.id)	
	end


	private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

       def report_params
         params.require(:report).permit(:report_type,:summary, :effciency, :project_start_condition,
                 :todays_condition, :controls_in_place, :materials, :material ,:safety_meeting, :safety_doc, :image, :tomorrows_task, :todays_task)
       end
end
