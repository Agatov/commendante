@WidgetApp = do (Backbone, Marionette) ->

  App = new Marionette.Application

  App.addRegions
    mainRegion: '#main-region'

  App.on "before:start", (options) ->
    @widget = App.request "set:widget", options.widget

  App.addInitializer ->
    App.module("ReviewsApp").start()

  App