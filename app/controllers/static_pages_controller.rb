class StaticPagesController < ApplicationController
  def index
    @projects = current_user.projects    
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
