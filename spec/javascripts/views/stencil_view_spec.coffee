describe "Stencil View", ->
  it "should display with a stencil", ->
    container = sandbox()

    stencil = new Stencil(name: "Rectangle")
    expect(stencil.get('name')).toEqual "Rectangle"

    view = new StencilView(stencil: stencil)
    container.append(view.el)
    expect(container).toContain ".stencil"
  