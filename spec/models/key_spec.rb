require 'spec_helper'

describe Key do

  before :each do
    @english = Language.create(:name => "English")
    @jibberish = Language.create(:name => "Jibberish")
  end

  describe "#create" do

    context "validates presence of :word" do
      it "invalid on #create when :word is nil" do
        bad_params = { :word => nil, :language => @english }
        Key.create(bad_params).valid?.should be_false
        Key.count.should == 0
      end

      it "invalid on #create when :word is \"\" (an empty string)" do
        bad_params = { :word => "", :language => @english }
        Key.create(bad_params).valid?.should be_false
        Key.count.should == 0
      end

    end # end of context

    context "validates the uniqueness of :word" do
      before :each do
        Key.create(:word => "some-word", :language => @english)
      end

      it "invalid on #create when :word is set to a duplicate value" do
        bad_params = { :word => "some-word", :language => @english }
        Key.create(bad_params).valid?.should be_false
      end

      it "valid on #create when same :word is in a different language" do
        bad_params = { :word => "some-word", :language => @jibberish }
        Key.new(bad_params).valid?.should be_true
        Key.create(bad_params)
        Key.count.should == 2
      end

    end # end of context
  
  end # end of #create

end # end of Key