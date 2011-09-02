require 'spec_helper'

describe Theme do

  it "should find the default theme" do
    Theme.create!(name: 'whiteboard')
    Theme.default.name.should == 'whiteboard'
  end

  it "should know if it is the default" do
    theme = Theme.new(name: 'whiteboard')
    theme.default?.should be_true
  end 

  it "should know it's NOT the default" do
    theme = Theme.new(name: 'blueprint')
    theme.default?.should be_false
  end
  
end