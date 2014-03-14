require 'spec_helper'

describe Users::UsersController do
  render_views
  
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  let(:user) { create(:user) }

  it "returns 'Unauthorized' if not signed in" do
    post :is_user, { name: user.name, format: :json }

    expect(response.status).to eq 401
    
  end

  it "returns true if the username exists" do
    sign_in user
    post :is_user, { name: user.name, format: :json }
    expect(response).to be_success
    
    json = JSON.parse response.body
    expect(json['success']).to eq true
  end
  
  it "returns false if the username does not exist" do
    sign_in user
    post :is_user, { name: Faker::Name.name, format: :json }
    expect(response).to be_success
    
    json = JSON.parse response.body
    expect(json['success']).to eq false
  end
end
