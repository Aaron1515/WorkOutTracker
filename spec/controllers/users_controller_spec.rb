require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'Get #index' do
  end


  describe "POST #create" do

    let(:user) { User.new( name: 'Aaron', email: 'aaron@aaron.com',password: 'password') }

    context "with valid attributes" do
      it "saves the new post" do
        expect{user.save}.to change(User,:count).by(1)
      end
    end

  end

end

