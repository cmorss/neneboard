require 'spec_helper'

describe Stencil do

  before(:each) do
   
  end

  it "should find a specific style" do
    whiteboard = Style.create!(name: 'whiteboard')
    chalkboard = Style.create!(name: 'chalkboard')

    stencil = Stencil.create!
    stencil.renderers = [
      Renderer.create!(stencil: stencil, style: whiteboard),
      Renderer.create!(stencil: stencil, style: chalkboard)
    ]
 
    stencil.renderer_for(whiteboard).should be
    stencil.renderer_for(whiteboard).style.should == whiteboard
    stencil.renderer_for(chalkboard).style.should == chalkboard
  end

  it "should default to whiteboard when not found" do
    whiteboard = Style.new(name: 'whiteboard')
    chalkboard = Style.new(name: 'chalkboard')

    stencil = Stencil.new
    stencil.renderers = [
      Renderer.new(stencil: stencil, style: whiteboard),
    ]

    stencil.renderer_for(whiteboard).should be
    stencil.renderer_for(whiteboard).style.should == whiteboard
    stencil.renderer_for(chalkboard).style.should == whiteboard
  end

end