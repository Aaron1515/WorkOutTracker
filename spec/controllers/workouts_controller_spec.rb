require 'rails_helper'

RSpec.describe WorkoutsController, type: :controller do

  let(:user) { User.new( name: 'Aaron', email: 'a@a.com',password: 'password') }

  let(:workout) {Workout.new(name: 'bench press', reps: 8, sets: 4, weight: '50', completed: true, phase: 1, rest: 30, user_id: @user.id,day: 1,note: 'note')}


  describe 'Get #index' do
  end

  describe 'Get #show' do

    before(:each) do
    @user = User.create( name: 'Aaron', email: 'b@b.com',password: 'password')
    @workout = Workout.create(name: 'bench press', reps: 8, sets: 4, weight: '50', completed: true, phase: 1, rest: 30, user_id: @user.id,day: 1,note: 'note')
    end


    # need to complete test for this
    it 'responds with 200' do
      get user_workout_path(user_id: @user.id, id: @workout.id)
      expect(response).to be true
    end
  end

  describe 'Get #new' do
  end

  describe 'Get #edit' do
  end

  describe 'Get #update' do
  end

  describe 'Get #destroy' do
  end

end
