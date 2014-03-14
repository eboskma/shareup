class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
         
  has_many :authorizations, dependent: :destroy
  has_many :shares, foreign_key: 'from_user_id'
  
  def self.from_social_name(name)
    user = User.find_by(name: name)
    if user.nil?
      user = User.create name: name, password: Devise.friendly_token, email: "#{UUIDTools::UUID.random_create}@shareup.com"
    end
    
    user
  end
end
