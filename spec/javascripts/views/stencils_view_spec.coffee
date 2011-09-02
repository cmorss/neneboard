describe "Stencils View", ->
  it "should display with stencils", ->

    stencil1 = new Stencil(name: 'Rectangle')
    stencil2 = new Stencil(name: 'Circle')

    view = new StencilsView(stencils: [stencil1, stencil2])

    container = sandbox()
    container.append(view.el)
    expect(container.find('.stencil').length).toEqual(2)
 