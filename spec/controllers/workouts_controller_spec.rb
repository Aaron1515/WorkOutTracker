require 'rails_helper'

RSpec.describe WorkoutsController, type: :controller do

  let(:user) { User.new( name: 'Aaron', email: 'a@a.com',password: 'password') }

  let(:workout) {Workout.new(name: 'bench press', reps: 8, sets: 4, weight: '50', completed: true, phase: 1, rest: 30, user_id: @user.id,day: 1,note: 'note')}


  describe 'Get #index' do
    it "renders the :index template" do
      # user = User.create(name: 'jon', email:'asdfasfd@asdfasf.com', password: 'password', admin: true)
      # get :new, use_route: 'user_workouts', :user_id => user.id
      # expect(response).to render :index
    end
  end

  describe 'Get #show' do

    before(:each) do
    @user = User.create( name: 'Aaron', email: 'b@b.com',password: 'password')
    @workout = Workout.create(name: 'bench press', reps: 8, sets: 4, weight: '50', completed: true, phase: 1, rest: 30, user_id: @user.id,day: 1,note: 'note')
    end


    it 'responds with 200' do
    end
  end




  describe 'Get #new' do


    it "assigns a new Workout to @workout" do
      user = User.create(name: 'jon', email:'test@test.com', password: 'password', admin: true)
      get :new, use_route: 'new_user_workout', :user_id => user.id
      expect(response).to render_template :new

    end

    it "renders the :new _form.html.erb" do
    end

  end

  describe 'Get #edit' do
  end

  describe 'Get #update' do
  end

  describe 'Get #destroy' do
  end

end
