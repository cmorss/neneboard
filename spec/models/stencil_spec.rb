require 'spec_helper'

describe Stencil do

  before(:each) do
   
  end

  it "should find a specific theme" do
    whiteboard = Theme.create!(name: 'whiteboard')
    chalkboard = Theme.create!(name: 'chalkboard')

    stencil = Stencil.create!
    stencil.renderers = [
      Renderer.create!(stencil: stencil, theme: whiteboard),
      Renderer.create!(stencil: stencil, theme: chalkboard)
    ]
 
    stencil.renderer_for(whiteboard).should be
    stencil.renderer_for(whiteboard).theme.should == whiteboard
    stencil.renderer_for(chalkboard).theme.should == chalkboard
  end

  it "should default to whiteboard when not found" do
    whiteboard = Theme.new(name: 'whiteboard')
    chalkboard = Theme.new(name: 'chalkboard')

    stencil = Stencil.new
    stencil.renderers = [
      Renderer.new(stencil: stencil, theme: whiteboard),
    ]

    stencil.renderer_for(whiteboard).should be
    stencil.renderer_for(whiteboard).theme.should == whiteboard
    stencil.renderer_for(chalkboard).theme.should == whiteboard
  end

end