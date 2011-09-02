describe("Stencil View", function() {
  return it("should display with a stencil", function() {
    var container, stencil, view;
    container = sandbox();
    stencil = new Stencil({
      name: "Rectangle"
    });
    expect(stencil.get('name')).toEqual("Rectangle");
    view = new StencilView({
      stencil: stencil
    });
    container.append(view.el);
    return expect(container).toContain(".stencil");
  });
});