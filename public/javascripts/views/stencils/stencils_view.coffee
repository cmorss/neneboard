class StencilsView extends Backbone.View
  initialize: ->
    this.render()

  handleResize: =>
    parentHeight = $(@el).parent().height()
    $(@el).css(height: parentHeight/2 + 'px')

  getPreferredDimensions: ->
    height: 120

  render: =>
    stencilsContainer = $(this.make('div', id: 'stencils-container'))

    # Just use the first group, it will have everything in it.
    stencils = @options.stencilGroups.models[0].get('stencils').models

    # Just fill up the container w/ the same stuff over and over to
    # get a feel about how things will look.
    for num in [10..1]
      _.each stencils, (stencil) =>
        stencilView = new StencilView(stencil: stencil)
        stencilsContainer.append $(stencilView.el)
        stencilsContainer.width(stencilsContainer.width() + 102)  # This hardcoded 102 is crappy
 
    $(@el).append stencilsContainer

    $(this.el).mouseover =>
      $(this.el).css 'overflow-x', 'auto'

    $(this.el).mouseout =>
      $(this.el).css 'overflow-x', 'hidden'
      
    themesSelector = new App.Views.ThemeSelector({themes: this.options.themes})

  renderInTabs: =>
    stencilGroups = $(this.make('div', id: 'stencil-groups'))

    ul = $("<ul>", id: 'stencil-tabs')
    stencilGroups.append(ul);
  
    _.each @options.stencilGroups.models, (group) =>
      id = 'id-' + group.get('label')
      li = $("<li>")
      li.append($("<a>", href: "##{id}", text: group.get('label')))
      ul.append(li)

      stencilGroup = $("<div>", id: id, class: "stencil-group")
      _.each group.get('stencils').models, (stencil) =>
        stencilView = new StencilView(stencil: stencil)
        stencilGroup.append $(stencilView.el)

      stencilGroup.append $("<div>", style: "clear:both")
      stencilGroups.append stencilGroup

    $(@el).append(stencilGroups);
    stencilGroups.tabs()

    themesSelector = new App.Views.ThemeSelector({themes: this.options.themes})

