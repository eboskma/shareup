class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  after_filter :set_csrf_cookie
  
  def failure
    render 'shared/failure', status: :unauthorized
  end
  
  protected
  def reject_if_not_authorized_request!
    warden.authenticate!(
      scope: resource_name,
      recall: "#{controller_path}#failure"
    )
  end

  private
  def set_csrf_cookie
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end
  
  def verified_request?
    super || form_authenticity_token == request.headers['HTTP_X_XSRF_TOKEN']
  end
end
