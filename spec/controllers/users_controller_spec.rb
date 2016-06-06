require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { User.new( name: 'Aaron', email: 'aaron@aaron.com',password: 'password') }

  describe 'Get #index' do

    it "respond to 200 status" do
      expect(response.status).to eq(200)
    end

  end

  describe "GET #show" do

  end

  describe "POST #create" do

    let(:user) { User.new( name: 'Aaron', email: 'aaron@aaron.com',password: 'password') }

  end

end

