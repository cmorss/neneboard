class StencilView extends Backbone.View
  tagName:   'div'
  className: 'stencil'
    
  initialize: ->
    this.render()

  render: =>
    label = $("<label>").text @options.stencil.get("name")
    @canvas = this.make "canvas"
    $(@el).append @canvas
    $(@el).append label