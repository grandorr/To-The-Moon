require 'rails_helper'
100.times do
	RSpec.describe User, type: :model do

	  before(:each) do 
	    @user = FactoryBot.build(:user)
	  end

	  it "has a valid factory" do
	    expect(build(:user)).to be_valid
	  end

	  context "validation" do

	    it "is valid with valid attributes" do
	      expect(@user).to be_a(User)
	    end

	    describe "#email" do
	    	it { expect(@user).to validate_presence_of(:email) }
	    end

	    describe "#password" do
	    	it { expect(@user).to validate_length_of(:password).is_at_least(6) }
	    end

	  end

	  context "associations" do

	    describe "articles" do
				it { expect(@user).to have_many(:articles) }
	    end

	  end



	  context "public instance methods" do

	    describe "#email" do

	      it "should return a string" do
	        expect(@user.email).to be_a(String)
	      end

	    end

	  end

	end
end