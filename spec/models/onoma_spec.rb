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

end
