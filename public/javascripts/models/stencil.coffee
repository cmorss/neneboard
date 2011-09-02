class Stencil extends Backbone.Model
  defaults:
    name: null
    stencilGroups: null

  initialize: =>
    this.set(stencilGroups: new StencilGroupsCollection())
    
  url: =>
     base = 'stencils'
     return base if this.isNew()

     base + (base.charAt(base.length - 1) == '/' ? '' : '/') + @id

  parse: (resp, xhr) ->
    resp.stencil;

class StencilsCollection extends Backbone.Collection
  model: Stencil
  url: '/stencils'
 