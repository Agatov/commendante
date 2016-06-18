@WidgetApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Widget extends Entities.Model


  API =

    setWidget: (options) ->
      App.widget = new Entities.Widget(options)


  App.reqres.setHandler "set:widget", (options) ->
    API.setWidget options

  App.reqres.setHandler "current:widget", ->
    App.widget
