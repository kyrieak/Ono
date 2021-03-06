require 'spec_helper'

describe Link do
  
  before :each do
    @jibberish = Language.create(:name => "Jibberish")
    @key = Key.create( :word => "jibber-jabber",
                       :language => @jibberish )
    @onoma = Onoma.create( :name => "bop!",
                           :language => @jibberish )
  end

  describe "#create" do

    context "validates presence of :key" do
      it "is invalid when :key is nil" do
        bad_params = { :key => nil,
                       :onoma => @onoma }
        Link.new(bad_params).valid?.should be_false
        Link.create(bad_params)
        Link.count.should == 0
      end

      it "is valid when :key is present" do
        good_params = { :key => @key,
                        :onoma => @onoma }
        Link.new(good_params).valid?.should be_true
        Link.create(good_params)
        Link.count.should == 1
      end

    end # end of context    

    context "validates presence of :onoma" do
      it "is invalid when :onoma is nil" do
        bad_params = { :key => @key,
                       :onoma => nil }
        Link.new(bad_params).valid?.should be_false
        Link.create(bad_params)
        Link.count.should == 0
      end

      it "is valid when :onoma is present" do
        good_params = { :key => @key,
                        :onoma => @onoma }
        Link.new(good_params).valid?.should be_true
        Link.create(good_params)
        Link.count.should == 1
      end

    end # end of context
  
  end # end of #create

  describe "#duplicate?" do
    
    before :each do
      Link.create(:key => @key, :onoma => @onoma)
      @other_key = Key.create(:word => "jabber-jibber", :language => @jibberish)
    end

    it "returns true if a record with matching attributes is found" do
      @link = Link.new(:key => @key, :onoma => @onoma)
      @link.duplicate?.should be_true
    end

    it "returns false if no record with matching attributes is found" do
      @link = Link.new(:key => @other_key, :onoma => @onoma)
      @link.duplicate?.should be_false
    end

  end

end
