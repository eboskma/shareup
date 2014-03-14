class Users::UsersController < Devise::SessionsController
  respond_to :json
  
  def is_user
    reject_if_not_authorized_request!
    @user = User.find_by(name: params[:name])
  end
  
end
