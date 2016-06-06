require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Creating new user with valid info' do
    let(:user) { User.new( name: 'san', email: 'san@san.com',password: 'password') }

    it 'save with name, email, password' do
      expect(user.save).to equal(true)
    end

    it 'is valid with name equal to "san"' do
      expect(user.name).to include("san")
    end

    it 'is valid with email equal to "san@san.com"' do
      expect(user.email).to include("san@san.com")
    end

    it 'is valid with password equal to Hash String' do
      expect(user.password).to be_a_kind_of (String)
    end

    it 'is valid with the password "password"' do
      expect(user.password).to eq ('password')
    end

    it 'password is hash, has 60 chars encrypted' do
        expect(user.password_digest.length).to equal(60)
    end

    it 'new user is an Object' do
        expect(user).to be_a_kind_of(Object)
    end
      it "DB has aaron@aaron.com as user" do
        user.save
        new_user = User.find_by(email: "aaron@aaron.com")
        expect(new_user.email).to eq("aaron@aaron.com")
      end

      it "DB changed by 1 when creating user" do
        expect{user.save}.to change(User,:count).by(1)
      end

      it "DB's last entry is aaron@aaron.com" do
        user.save
        last_user = User.last
        expect(last_user.email).to eq("san@san.com")
      end

    describe 'Testing for false positive' do

      it 'is not false when saving new user with valid info' do
        expect(user.save).to_not equal(false)
      end

      it 'password is not password1' do
        expect(user.password).to_not equal("password1")
      end

      it 'new user is not Aarry' do
        expect(user).to_not equal(Array)
      end

      it 'new user is not String' do
        expect(user).to_not equal(String)
      end

    end

  end

# ActiveRecord Tests
  describe 'ActiveRecord associations' do

    it 'users has_many workouts' do
      expect(User.reflect_on_association(:workouts).macro).to be (:has_many)
    end

    it 'users has workouts in plural_name' do
      expect(User.reflect_on_association(:workouts).plural_name).to eq ("workouts")
    end

    it 'users has_many progresses' do
      expect(User.reflect_on_association(:progresses).macro).to be (:has_many)
    end

    it 'users has progresses in plural_name' do
      expect(User.reflect_on_association(:progresses).plural_name).to eq ("progresses")
    end

    it 'users has_many measurements' do
      expect(User.reflect_on_association(:measurements).macro).to be (:has_many)
    end

    it 'users has measurements in plural_name' do
      expect(User.reflect_on_association(:measurements).plural_name).to eq ("measurements")

    end


    describe 'Save data' do

      let(:user) {User.new}
      it 'is invalid when only name is present' do
        user.name = "Aaron"
        expect(user.save).to equal false
      end

      it 'is invalid when only email is present' do
        user.email = "Aaron@aaron.com"
        expect(user.save).to equal false
      end

      it 'is invalid when only password is present' do
        user.password = "password"
        expect(user.save).to equal false
      end

    end
    #add more test to model for through progress to measurment.

  end




  it "is invalid without a name" do
    user = User.new(name: nil, email: 'aaron@aaron.com', password: 'password')
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid without an email address" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    User.create(
      name: 'Joe',
      email: 'joe@joe.com',
      password: 'password')
    user = User.new(
      name: 'Jane',
      email: 'joe@joe.com',
      password: 'password')
    user.valid?
    expect(user.errors[:email]).to include('has already been taken')
  end

  it "returns a contact's name as a string" do
    user = User.new(name: 'Joe')
    expect(user.name).to be_a_kind_of(String)
  end

  it "returns a contact's email as a string" do
        user = User.new(email: 'joe@joe.com')
    expect(user.email).to be_a_kind_of(String)
  end
end
