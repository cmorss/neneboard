require "spec_helper"

describe "stencils/_stencil_admin.html.erb" do

  let(:whiteboard) do
    mock_model('Theme', name: 'whiteboard')
  end
  
  let(:napkin) do
    mock_model('Theme', name: 'napkin')
  end

  let(:themes) do

  end
  
  let(:rectangle) do

    stencil = mock('Stencil')
    stencil.stub!(:name, 'rectangle')
    stencil.stub!(:renderer_for) do |theme|
      if theme.name == 'whiteboard'
        mock_model('Renderer',
                    id: 1,
                    theme: whiteboard,
                    script: 'ctx.fillRect(0,0,100,100);')
      else
        mock_model('Renderer',
                    id: 2,
                    theme: napkin,
                    script: 'ctx.fillRect(10,10,90,90);')
      end
    end
    stencil
  end

  context 'when a new stencil is created' do

    before do
      view.stub(:admin?) { false }
    end

    context "and no stencil are present" do
      before do
        assign :themes, [whiteboard, napkin]
        render partial: '/stencils/stencil_admin',
               layout:  false,
               locals:  {stencil: rectangle, theme: whiteboard}
      end
 
      it "has a canvas" do 
        rendered.should have_selector 'canvas', count: 2
        rendered.should have_selector '#renderer_1', count: 1
        rendered.should have_selector '#renderer_2', count: 1
      end

      %W(postShow sequence title date).each do |klass|
        it "does not display div with class '#{klass}'" do
          rendered.should_not have_selector 'div', :class => klass
        end
      end
    end
  end
end