require 'spec_helper'

describe Key do

  before :each do
    @english = Language.create(:name => "English")
    @jibberish = Language.create(:name => "Jibberish")
  end

  describe "#create" do

    context "validates presence of :word" do
      it "is invalid when :word is nil" do
        bad_params = {  :word => nil,
                        :language => @english }
        Key.new(bad_params).valid?.should be_false
        Key.create(bad_params)
        Key.count.should == 0
      end

      it "is invalid when :word is \"\" (an empty string)" do
        bad_params = { :word => "",
                       :language => @english }
        Key.new(bad_params).valid?.should be_false
        Key.create(bad_params)
        Key.count.should == 0
      end

      it "is valid when :word is present" do
        good_params = { :word => "jibberish",
                        :language => @english }
        Key.new(good_params).valid?.should be_true
        Key.create(good_params)
        Key.count.should == 1
      end

    end # end of context

    context "validates the uniqueness of :word" do
      before :each do
        Key.create( :word => "jibberish",
                    :language => @english )
      end

      it "is invalid when :word is set to a duplicate value" do
        bad_params = { :word => "jibberish",
                       :language => @english }
        Key.new(bad_params).valid?.should be_false
        Key.create(bad_params)
        Key.count.should == 1
      end

      it "valid on #create when same :word is in a different language" do
        good_params = { :word => "jibberish",
                        :language => @jibberish }
        Key.new(good_params).valid?.should be_true
        Key.create(good_params)
        Key.count.should == 2
      end

    end # end of context
  
  end # end of #create

end # end of Key