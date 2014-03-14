require 'spec_helper'

describe Users::SessionsController do
  let(:user) { create(:user) }
  
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  
  it "returns 'Unauthorized' if not signed in" do
    get :show_current_user, format: :json
    
    expect(response.status).to eq 401
  end
  
  it "returns user data when signed in" do
    sign_in user
    get :show_current_user, format: :json
    expect(response).to be_success
  end
end
