class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_and_belongs_to_many :projects
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable, :timeoutable

end
