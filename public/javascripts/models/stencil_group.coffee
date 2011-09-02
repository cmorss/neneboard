class StencilGroup extends Backbone.Model
  defaults:
    label: null
    stencils: null

  initialize: ->
    this.set(stencils: new App.Models.StencilsCollection())

  url: =>
     base = 'stencil_groups'
     return base if this.isNew()

     base + (base.charAt(base.length - 1) == '/' ? '' : '/') + @id

  parse: (resp, xhr) ->
    resp.stencil_group;

class StencilGroupsCollection extends Backbone.Collection
  model: StencilGroup
  url: '/stencil_groups'
