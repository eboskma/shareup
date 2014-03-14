class Users::SessionsController < Devise::SessionsController
  respond_to :json
  
  def show_current_user
    reject_if_not_authorized_request!
  end
  
  # def failure
  #   render 'failure', status: :unauthorized
  # end
  # 
  # private
  # def reject_if_not_authorized_request!
  #   warden.authenticate!(
  #     scope: resource_name,
  #     recall: "#{resource_name}#failure"
  #   )
  # end
end
