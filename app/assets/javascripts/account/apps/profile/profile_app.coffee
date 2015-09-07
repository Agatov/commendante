@AccountApp.module "ProfileApp", (ProfileApp, App, Backbone, Marionette, $, _) ->

  class ProfileApp.Router extends Marionette.AppRouter
    appRoutes:
      'profile(/)': 'showForm'

  App.addInitializer ->
    new ProfileApp.Router
      controller: API

  API = 

    showForm: ->
      ProfileApp.Form.Controller.show()

    save: (profile, cb) ->
      ProfileApp.Profile.Controller.save profile, cb

  App.vent.on "show:profile", ->
    App.navigate "profile"
    API.showForm()

  App.vent.on "save:profile", (profile, cb) ->
    API.save profile, cb
