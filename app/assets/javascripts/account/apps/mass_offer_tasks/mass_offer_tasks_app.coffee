@AccountApp.module "MassOfferTasksApp", (MassOfferTasksApp, App, Backbone, Marionette, $, _) ->

  class MassOfferTasksApp.Router extends Marionette.AppRouter
    appRoutes:
      'mot(/)': 'showForm'

  App.addInitializer ->
    new MassOfferTasksApp.Router
      controller: API

  API = 

    showForm: ->
      MassOfferTasksApp.Form.Controller.show()

    save: (mot, cb) ->
      MassOfferTasksApp.MassOfferTask.Controller.save mot, cb

  App.vent.on "show:mass:offer:task:form", ->
    App.navigate "mot"
    API.showForm()

  App.vent.on "save:mass:offer:task", (mot, cb) ->
    API.save mot, cb