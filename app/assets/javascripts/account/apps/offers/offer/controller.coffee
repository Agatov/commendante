@AccountApp.module "OffersApp.Offer", (Offer, App, Backbone, Marionette, $, _) ->

  Offer.Controller = 

    save: (offer, cb) ->
      offer.save null,
        success: ->
          cb()

    delete: (offer, cb) ->
      offer.destroy
        success: ->
          cb()