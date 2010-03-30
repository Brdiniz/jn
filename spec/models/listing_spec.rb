require 'spec_helper'

describe Listing do
  
  it "should create a new instance given valid attributes" do
    l = Factory(:listing)
  end
  
  it "should verify listing active" do
    l = Factory(:listing, :day_count => 10)
    l.active.should be_true
    
    l.actived_at = l.actived_at.to_date - 10.days
    l.active.should be_true
    
    l.actived_at = l.actived_at.to_date - 1.days
    l.active.should be_false
  end
  
  it "should enable and disable listing" do
    l = Factory(:listing, :day_count => 30)
    l.disable_listing
    l.active.should_not be_true
    l.day_count.should == -1
    l.enable_listing
    l.active.should be_true
    l.day_count.should == 10
  end
end