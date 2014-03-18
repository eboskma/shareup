class SharesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]
  respond_to :json
  
  def index
    render json: []
  end
  
  def create
    # link = params[:url]
    share_params = { from_user_id: current_user.id, url: params[:url] }
    
    to_user = User.where('email = :user OR name = :user', user: params[:user])
    
    if to_user.any?
      share_params[:to_user_id] = to_user.first.id
    else
      share_params[:to_email] = params[:user]
    end
    
    @share = Share.create(share_params)
  end
end
