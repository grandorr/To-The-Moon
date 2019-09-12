require 'rails_helper'
100.times do
	RSpec.describe Tag, type: :model do

	  before(:each) do 
	    @tag = FactoryBot.build(:tag)
	  end

	  it "has a valid factory" do
	    expect(build(:tag)).to be_valid
	  end

	  context "validation" do

	    it "is valid with valid attributes" do
	      expect(@tag).to be_a(Tag)
	    end

	  end

	  context "associations" do

	    describe "articles" do
				it { expect(@tag).to have_many(:articles) }
	    end

	  end

	  context "public instance methods" do

	    describe "#tag" do

	      it "should return a string" do
	        expect(@tag.name).to be_a(String)
	      end

	    end

	  end

	end
end