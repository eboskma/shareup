class WelcomeController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  layout :choose_layout
  
  def index
    
  end
  
  def dashboard
    
  end
  
  protected
    def choose_layout
      user_signed_in? ? 'angular' : 'application'
    end
end
