@AccountApp.module "OptionsApp", (OptionsApp, App, Backbone, Marionette, $, _) ->

  class OptionsApp.Router extends Marionette.AppRouter
    appRoutes:
      'options(/)': 'showOptions'

  App.addInitializer ->
    new OptionsApp.Router
      controller: API

  API =

    showOptions: ->
      App.navigate "options"
      OptionsApp.Page.Controller.show()

    save: (widget, cb) ->
      OptionsApp.Widget.Controller.save widget, cb

  App.vent.on "show:options", ->
    API.showOptions()

  App.vent.on "save:widget", (widget, cb) ->
    API.save widget, cb

