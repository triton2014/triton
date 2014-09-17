class StaticPagesController < ApplicationController
  def index
    @projects = Project.find(:all, :conditions => ["manager_id = ? ", current_user.id])    
  end

  def profile
  end

  def project
  end

  def chat
  end

  def help
  end

  def help1    
  end

end
