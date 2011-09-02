class TimelineView extends Backbone.View

  el: '#timeline'

  initialize: ->
    @board = @options.board;

  render: =>
    lines = this.make('div', {className: 'timeline-shapes-container'})

    _.each @board.get('shapes').models, (shape) =>
      lines.append(new TimelineShapeView(shape).el)

    $(@el).append(lines)