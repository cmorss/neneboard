class BoardView extends Backbone.View
  el: '#board',

  initialize: ->
    this.render()

  render: =>
    $(@el).html(JST['boards/board_view'](board: @model))
