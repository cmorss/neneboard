require 'spec_helper'

describe Style do

  it "should find the default style" do
    Style.create!(name: 'whiteboard')
    Style.default.name.should == 'whiteboard'
  end

  it "should know if it is the default" do
    style = Style.new(name: 'whiteboard')
    style.default?.should be_true
  end 

  it "should know it's NOT the default" do
    style = Style.new(name: 'blueprint')
    style.default?.should be_false
  end
  
end