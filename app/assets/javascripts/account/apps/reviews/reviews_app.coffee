@AccountApp.module "ReviewsApp", (ReviewsApp, App, Backbone, Marionette, $, _) ->

  class ReviewsApp.Router extends Marionette.AppRouter
    appRoutes:
      '(/)': 'showAllReviews'
      'reviews(/)': 'showAllReviews'
      'reviews/new(/)': 'showNewReviews'
      'reviews/confirmed(/)': 'showConfirmedReviews'
      'reviews/rejected(/)': 'showRejectedReviews'

  App.addInitializer ->
    new ReviewsApp.Router
      controller: API


  API =

    showAllReviews: ->
      ReviewsApp.List.Controller.show()

    showNewReviews: ->
      ReviewsApp.List.Controller.show "new"

    showConfirmedReviews: ->
      ReviewsApp.List.Controller.show "confirmed"

    showRejectedReviews: ->
      ReviewsApp.List.Controller.show "rejected"

    confirm: (review, cb) ->
      ReviewsApp.Review.Controller.confirm review, cb

    reject: (review, cb) ->
      ReviewsApp.Review.Controller.reject review, cb

    cancel: (review, cb) ->
      ReviewsApp.Review.Controller.cancel review, cb


  App.vent.on "show:reviews", ->
    App.navigate "reviews"
    API.showAllReviews()

  App.vent.on "show:new:reviews", ->
    App.navigate "reviews/new"
    API.showNewReviews()

  App.vent.on "show:confirmed:reviews", ->
    App.navigate "reviews/confirmed"
    API.showConfirmedReviews()

  App.vent.on "show:rejected:reviews", ->
    App.navigate "reviews/rejected"
    API.showRejectedReviews()

  App.vent.on "confirm:review", (review, cb) ->
    API.confirm review, cb

  App.vent.on "reject:review", (review, cb) ->
    API.reject review, cb

  App.vent.on "cancel:review", (review, cb) ->
    API.cancel review, cb
