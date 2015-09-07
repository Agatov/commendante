@AccountApp.module "OffersApp", (OffersApp, App, Backbone, Marionette, $, _) ->

  class OffersApp.Router extends Marionette.AppRouter
    appRoutes:
      'offers(/)': 'showOffers'

  App.addInitializer ->
    new OffersApp.Router
      controller: API

  API = 

    showOffers: ->
      OffersApp.List.Controller.show()

    save: (offer, cb) ->
      OffersApp.Offer.Controller.save offer, cb

    delete: (offer, cb) ->
      OffersApp.Offer.Controller.delete offer, cb


  App.vent.on "show:offers", ->
    App.navigate "offers"
    API.showOffers()

  App.vent.on "save:offer", (offer, cb) ->
    API.save offer, cb

  App.vent.on "delete:offer", (offer, cb) ->
    API.delete offer, cb
