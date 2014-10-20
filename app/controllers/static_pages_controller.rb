class StaticPagesController < ApplicationController
  def index
    @projects = current_user.projects    
  end

  def profile
  end

  def edit_profile
  end

  def update_profile
    #Cloudinary::Uploader.upload(params[:avatar])
    current_user.avatar = params[:avatar]
    current_user.first_name = params[:first_name]
    current_user.last_name = params[:last_name]
    current_user.email = params[:email]
    current_user.password = params[:password]
    current_user.password_confirmation = params[:password_confirmation]
    current_user.save(:validate => false)
    redirect_to new_user_session_path

  end


  def project
  end

  def chat
     @projects = current_user.projects 
  end

  def help
  end


end
