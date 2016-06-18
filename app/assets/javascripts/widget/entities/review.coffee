@WidgetApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Review extends Entities.Model

  class Entities.ReviewsCollection extends Entities.Collection
    model: Entities.Review


  API = 

    getReviews: (widget, cb) ->
      reviews = new Entities.ReviewsCollection

      reviews.url = "api/reviews/#{widget.get('uid')}"

      reviews.fetch
        success: ->
          cb reviews
          

  App.reqres.setHandler "entities:reviews", (widget, cb) ->
    API.getReviews widget, cb