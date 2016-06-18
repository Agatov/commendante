Backbone.Marionette.Renderer.render = (template, data) ->
  path = JST["widget/apps/" + template]
  unless path
    throw "Template #{template} not found!"
  path(data)