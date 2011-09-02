class TimelineShapeView extends Backbone.View

  className: 'timeline-shape'

  render: =>
    line = this.make($('div', {className: 'name'}, @model.get('stencil').get('name')))
    $(@el).append(line)
 