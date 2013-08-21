require 'spec_helper'

describe Key do

  before :each do
    @jibberish = Language.create(:name => "Jibberish")
  end

  describe "#create" do

    context "validates presence of :word" do
      it "is invalid when :word is nil" do
        bad_params = {  :word => nil,
                        :language => @jibberish }
        Key.new(bad_params).valid?.should be_false
        Key.create(bad_params)
        Key.count.should == 0
      end

      it "is invalid when :word is \"\" (an empty string)" do
        bad_params = { :word => "",
                       :language => @jibberish }
        Key.new(bad_params).valid?.should be_false
        Key.create(bad_params)
        Key.count.should == 0
      end

      it "is valid when :word is present" do
        good_params = { :word => "jibber-jabber",
                        :language => @jibberish }
        Key.new(good_params).valid?.should be_true
        Key.create(good_params)
        Key.count.should == 1
      end

    end # end of context
  
  end # end of #create

end # end of Key