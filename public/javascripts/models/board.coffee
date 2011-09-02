class Board extends Backbone.Model

  defaults:
    name: null
    shapes: null

  initialize: (attrs) ->
    @attributes.shapes =  attrs.shapes || new ShapesCollection({});

  url: =>
     base = 'boards'
     return base if this.isNew()
     base + (base.charAt(base.length - 1) == '/' ? '' : '/') + @id
