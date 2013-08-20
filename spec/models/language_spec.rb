require 'spec_helper'

describe Language do

  describe "#create" do

    context "validates presence of :name" do
      it "invalid on #create when :name is nil" do
        Language.new(:name => nil).valid?.should be_false
        Language.create(:name => nil)
        Language.count.should == 0
      end

      it "invalid on #create when :name is \"\" (an empty string)" do
        Language.new(:name => "").valid?.should be_false
        Language.create(:name => "")
        Language.count.should == 0
      end

      it "valid on #create when :name is present" do
        Language.new(:name => "name").valid?.should be_true
        Language.create(:name => "name")
        Language.count.should == 1
      end

    end # end of context

    context "validates the uniqueness of :name" do
      before :each do
        Language.create(:name => "English")
      end

      it "invalid on #create when :name is set to a duplicate value" do
        Language.new(:name => "English").valid?.should be_false
        Language.create(:name => "English")
        Language.count.should == 1
      end

      it "valid on #create when :name is unique" do
        Language.new(:name => "jibberish").valid?.should be_true
        Language.create(:name => "jibberish")
        Language.count.should == 2
      end

    end # end of context
  
  end # end of #create
end
