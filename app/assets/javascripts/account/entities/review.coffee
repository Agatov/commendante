@AccountApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Review extends Entities.Model

    confirm: (cb) ->
      @set "moderated", true
      @saveWithCb cb

    reject: (cb) ->
      @set "moderated", false
      @saveWithCb cb

    cancel: (cb) ->
      @set "moderated", null
      @saveWithCb cb

    saveWithCb: (cb) ->
      @save null,
        success: ->
          cb() if cb



  class Entities.ReviewsCollection extends Entities.Collection
    model: Entities.Review

  API = 

    getReviews: (type, cb) ->
      reviews = new Entities.ReviewsCollection
      reviews.url = "/account/reviews"
      reviews.url += "/?type=#{type}" if type
      
      reviews.fetch
        success: ->

          App.reqres.setHandler 'entities:reviews:loaded', ->
            reviews

          cb reviews

      reviews


  App.reqres.setHandler "entities:reviews", (type, cb) ->
    API.getReviews type, cb