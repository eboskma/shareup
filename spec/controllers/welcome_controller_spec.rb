require 'spec_helper'

describe WelcomeController do
  let(:user) { create(:user) }
  
  it "renders the index view without a user" do
    get :index
    expect(response.status).to eq 200
    expect(response).to render_template 'index'
  end
  
  it "renders the dashboard with the Angular template" do
    sign_in user
    get :dashboard
    expect(response).to render_template 'dashboard'
  end
  
  it "redirects from the dashboard to index without a user" do
    get :dashboard
    expect(response).to be_redirect
  end
end
