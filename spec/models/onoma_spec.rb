require 'spec_helper'

describe Onoma do
  
  before :each do
    @jibberish = Language.create(:name => "Jibberish")
  end

  describe "#create" do

    context "validates presence of :name" do
      it "is invalid when :name is nil" do
        bad_params = { :name => nil,
                       :language => @jibberish }
        Onoma.new(bad_params).valid?.should be_false
        Onoma.create(bad_params)
        Onoma.count.should == 0
      end

      it "is invalid when :name is \"\" (an empty string)" do
        bad_params = { :name => "",
                       :language => @jibberish }
        Onoma.new(bad_params).valid?.should be_false
        Onoma.create(bad_params)
        Onoma.count.should == 0
      end

      it "is valid when :name is present" do
        good_params = { :name => "bop!",
                        :language => @jibberish }
        Onoma.new(good_params).valid?.should be_true
        Onoma.create(good_params)
        Onoma.count.should == 1
      end

    end # end of context
  
  end # end of #create

  describe "#duplicate?" do

    before :each do
      Onoma.create(:name => "bop!", :language => @jibberish)
    end

    it "returns true if a record with matching attributes is found" do
      @onoma = Onoma.new(:name => "bop!", :language => @jibberish)
      @onoma.duplicate?.should be_true
    end

    it "returns false if no record with matching attributes is found" do
      @onoma = Onoma.new(:name => "boppity", :language => @jibberish)
      @onoma.duplicate?.should be_false
    end

  end # end of #duplicate

end
