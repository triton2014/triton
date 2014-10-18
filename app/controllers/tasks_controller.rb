class TasksController < ApplicationController
	def new
		@report = Report.find(params[:report_id])
    	@task = @report.tasks.build
	end

	def edit
		@task = Task.find(params[:id])		
	end

	def create
		@report = Report.find(params[:report_id])
    	@task = @report.tasks.build
	    @task.task_type = params[:task_type]
	    @task.target_task = params[:target_task]
	    @task.completed_task = params[:completed_task]
	    @task.efficiency = params[:efficiency]
	    @task.save
	    redirect_to project_site_report_path(@report.site.project.id,@report.site.id,@report.id)

	end

end
