describe("Stencils View", function() {
  return it("should display with stencils", function() {
    var container, stencil1, stencil2, view;
    stencil1 = new Stencil({
      name: 'Rectangle'
    });
    stencil2 = new Stencil({
      name: 'Circle'
    });
    view = new StencilsView({
      stencils: [stencil1, stencil2]
    });
    container = sandbox();
    container.append(view.el);
    return expect(container.find('.stencil').length).toEqual(2);
  });
});