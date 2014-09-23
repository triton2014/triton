class DashboardsController < ApplicationController
	def index
		if current_user.role == 'admin'
			@users = User.all
		else	
			@projects = current_user.projects
		end
	end

	def new_user
		if current_user.role = 'admin'
			@user1= User.new
		end
	end

	def create_new_user
		if current_user.role = 'admin'
			@user1 = User.new
			@user1.first_name = params[:first_name]
			@user1.last_name = params[:last_name]
			@user1.email = params[:email]
			@user1.role = params[:role]
			@user1.password = params[:password]
			@user1.password_confirmation = params[:password_confirmation]
			@user1.save(:validate => false)
			redirect_to show_user_dashboards_path({:id => @user1.id})

        	UserMailer.registration_confirmation(@user1,params[:password]).deliver

		end
	end

	def show_user
		@user = User.find(params[:id])
	end

	def delete_user
	  @deleted_user = User.find(params[:id])
	  @deleted_user.destroy
	  redirect_to dashboards_path
	end

	def edit_user
		@edited_user = User.find(params[:id])
	end


	def update_user
	  
	  if current_user.role = 'admin'
		@edited_user = User.find_by_id(params[:id])	
		@edited_user.first_name = params[:first_name]
		@edited_user.last_name = params[:last_name]
		@edited_user.email = params[:email]
		@edited_user.role = params[:role]
		@edited_user.password = params[:password]
		@edited_user.password_confirmation = params[:password_confirmation]
		
		@edited_user.save(:validate => false)
		redirect_to show_user_dashboards_path({:id => @edited_user.id})
	   
	   end
	 
	end

	def list_users
	 if current_user.role = 'Manager'
	 	@project = Project.find(params[:id])
    	@customers = User.find(:all, :conditions => ["role = 'Customer'"]) 

 	 end
 	end

 	def assign_users
 	 	@project = Project.find(params[:id])
 	 	if params[:user_ids] == nil
 	 		@project.users.clear
 	 		@project.users<<current_user
 	 	else
 	 		@project.users.clear
 	 		@project.users<<current_user
	 	 	params[:user_ids].each do |userid|
	 	 		user = User.find(userid)
	 	 		@project.users<<user
	 	 	end
 	 	end
 	 redirect_to @project
 	 end

 	def chat
	 	 @chat = Chat.new
	 	 @chats = Chat.find(:all, :conditions => ["project_id = ?",params[:id]])	
	end

 	 def post_chat
 	 	@chat1 = Chat.new
 	 	@chat1.project_id = params[:project_id]
 	 	@chat1.user_id = current_user.id
 	 	@chat1.message = params[:message]
 	 	@chat1.save
 	 	redirect_to chat_dashboards_path(id: params[:project_id])

 	 end


end
