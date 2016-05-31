require 'rails_helper'

RSpec.describe Workout, type: :model do


# Model test for data input
  describe 'Workout to be valid' do

    let(:workout) {Workout.new(
      name: 'bench press',
      reps: 8,
      sets: 4,
      weight: '50',
      completed: true,
      phase: 1,
      rest: 30,
      user_id: 1,
      day: 1,
      note: 'note'
    )}

    it 'Rspec is present' do
      expect(true).to be true
    end

    it 'workout to be saved to db' do
      expect(workout.save).to be true
    end

  end




# ActiveRecord Tests
  describe 'ActiveRecord associations' do

    it 'workout belongs to users' do
      expect(Workout.reflect_on_association(:user).macro).to be (:belongs_to)
    end

  end


  it "is valid with a name, reps, sets, weight, completed, phase, rest, user_id, day, and note" do
    workout = Workout.new(
      name: 'bench press',
      reps: 8,
      sets: 4,
      weight: '50',
      completed: true,
      phase: 1,
      rest: 30,
      user_id: 1,
      day: 1,
      note: 'note')
    expect(workout).to be_valid
  end

  it "is invalid without a name" do
    workout = Workout.new(name: nil)
    workout.valid?
    expect(workout.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a reps" do
    workout = Workout.new(reps: nil)
    workout.valid?
    expect(workout.errors[:reps]).to include("can't be blank")
  end

  it "is invalid without a weight" do
    workout = Workout.new(weight: nil)
    workout.valid?
    expect(workout.errors[:weight]).to include("can't be blank")
  end

  it "is invalid without a phase" do
    workout = Workout.new(phase: nil)
    workout.valid?
    expect(workout.errors[:phase]).to include("can't be blank")
  end

  it "is invalid without a rest time" do
    workout = Workout.new(rest: nil)
    workout.valid?
    expect(workout.errors[:rest]).to include("can't be blank")
  end

  it "is invalid without a user_id" do
    workout = Workout.new(user_id: nil)
    workout.valid?
    expect(workout.errors[:user_id]).to include("can't be blank")
  end

  it "is invalid without a day" do
    workout = Workout.new(day: nil)
    workout.valid?
    expect(workout.errors[:day]).to include("can't be blank")
  end

  it "returns a workout name as a string" do
    workout = Workout.new(name: 'Dips')
    expect(workout.name).to be_a_kind_of(String)
  end

  it "returns reps as an integer" do
    workout = Workout.new(reps: 8)
    expect(workout.reps).to be_a_kind_of(Integer)
  end

  it "returns sets as an integer" do
    workout = Workout.new(sets: 8)
    expect(workout.sets).to be_a_kind_of(Integer)
  end

  it "returns weight as an string" do
    workout = Workout.new(weight: 'BW')
    expect(workout.weight).to be_a_kind_of(String)
  end

  it "returns phase as an integer" do
        workout = Workout.new(phase: 8)
    expect(workout.phase).to be_a_kind_of(Integer)
  end

  it "returns user_id as an integer" do
    workout = Workout.new(user_id: 8)
    expect(workout.user_id).to be_a_kind_of(Integer)
  end

  it "returns day as an integer" do
    workout = Workout.new(day: 8)
    expect(workout.day).to be_a_kind_of(Integer)
  end

  it "returns note as an string" do
    workout = Workout.new(note: 'good job')
    expect(workout.note).to be_a_kind_of(String)
  end
end
