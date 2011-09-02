class Shape extends Backbone.Model
  defaults:
    name: null

  url: =>
     base = 'shapes'
     return base if this.isNew()
     base + (base.charAt(base.length - 1) == '/' ? '' : '/') + @id

  parse: (resp, xhr) ->
    resp.shape

class ShapesCollection extends Backbone.Collection
  model: Shape
  url: '/shapes'
