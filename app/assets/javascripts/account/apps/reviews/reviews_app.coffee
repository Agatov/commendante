@AccountApp.module "ReviewsApp", (ReviewsApp, App, Backbone, Marionette, $, _) ->

  class ReviewsApp.Router extends Marionette.AppRouter
    appRoutes:
      '(/)': 'showAllReviews'
      'reviews(/)': 'showAllReviews'

  App.addInitializer ->
    new ReviewsApp.Router
      controller: API


  API =

    showAllReviews: ->
      ReviewsApp.List.Controller.show()

    showNewReviews: ->

    showConfirmedReviews: ->

    showRejectedReviews: ->

    confirm: (review, cb) ->
      ReviewsApp.Review.Controller.confirm review, cb

    reject: (review, cb) ->
      ReviewsApp.Review.Controller.reject review, cb

    cancel: (review, cb) ->
      ReviewsApp.Review.Controller.cancel review, cb


  App.vent.on "show:reviews", ->
    API.showAllReviews()

  App.vent.on "show:new:reviews", ->
    API.showNewReviews()

  App.vent.on "show:confirmed:reviews", ->
    API.showConfirmedReviews()

  App.vent.on "show:rejected:reviews", ->
    API.showRejectedReviews()

  App.vent.on "confirm:review", (review, cb) ->
    API.confirm review, cb

  App.vent.on "reject:review", (review, cb) ->
    API.reject review, cb

  App.vent.on "cancel:review", (review, cb) ->
    API.cancel review, cb
