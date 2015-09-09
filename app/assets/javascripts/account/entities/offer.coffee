@AccountApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Offer extends Entities.Model
    urlRoot: "/account/offers"


    validation:
      name: 
        required: true
        msg: 'Это поле обязательно для заполнения'
      
      email: [
        { 
          required: true
          msg: 'Это поле обязательно для заполнения'
        },
        {
          pattern: 'email'
          msg: 'Введите валидный email'
        }
        
      ]

  class Entities.OffersCollection extends Entities.Collection
    model: Entities.Offer
    url: "/account/offers"


  API = 

    getNewOffer: ->
      new Entities.Offer

    getOffer: (id, cb) ->
      offers = App.request 'entities:offers:loaded'
      if offers
        offer =  offers.get(id)
        cb(offer)
      else
        offer = new Entities.Offer({id: id})
        offer.fetch
          success: ->
            cb(offer)

    getOffers: (cb) ->
      offers = new Entities.OffersCollection
      offers.fetch
        success: ->
          App.reqres.setHandler 'entities:offers:loaded', ->
            offers

          cb offers

      offers


  App.reqres.setHandler "entities:offers", (cb) ->
    API.getOffers cb

  App.reqres.setHandler "entities:offer", (id, cb) ->
    API.getOffer id, cb

  App.reqres.setHandler "entities:offer:new", ->
    API.getNewOffer()