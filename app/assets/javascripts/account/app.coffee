@AccountApp = do (Backbone, Marionette) ->

  App = new Marionette.Application

  App.navigate = (route, options = {}) ->
    Backbone.history.navigate(route, options)
    Backbone.history.trigger "navigate"

  App.loadLineStart = ->
    NProgress.start()

  App.loadLineStop = ->
    NProgress.done()


  App.on "before:start", (options) ->
    @widget = App.request "set:widget", options.widget

#    Raven.setUserContext({
#        user_id: @profile.get("id")
#    })

    App.reqres.setHandler "get:widget", ->
      App.widget

    App.reqres.setHandler "get:widget:code", ->
      options.widget_code

  App.addRegions
    sidebarRegion: '#sidebar-region'
    mainRegion: '#main-region'
    modalRegion: '#modal-region'
    modalOverlayRegion: '#modal-overlay-region'
    alertRegion: '#alert-region'

  App.addInitializer ->
    App.module("SidebarApp").start()

  App.vent.on "navigate:to", (location_hash) ->
    window.location.hash = location_hash

  App.on 'start', ->
    if Backbone.history
      Backbone.history.start()

  #Marionette.Behaviors.behaviorsLookup = ->
  #  return App.Behaviors


  App