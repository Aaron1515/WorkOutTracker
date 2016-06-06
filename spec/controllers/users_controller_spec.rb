require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { User.new( name: 'Aaron', email: 'aaron@aaron.com',password: 'password') }

  describe 'Get #index' do

    it "responds successfully with an HTTP 302 status code when not logged in" do
      get :index
      expect(response).to have_http_status(302)
    end

    it "index redirects to new users template" do
      get :index
      expect(response).to redirect_to new_user_path
    end

  end


  describe "POST #create" do

    let(:user) { User.new( name: 'Aaron', email: 'aaron@aaron.com',password: 'password') }

  end

end

