require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with a name, email, and password" do
    user = User.new(
      name: 'Aaron',
      email: 'aaron@gmail.com', 
      password: 'password')
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(name: nil)
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
