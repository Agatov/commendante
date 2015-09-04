@AccountApp.module "ReviewsApp.Review", (Review, App, Backbone, Marionette, $, _) ->

  Review.Controller = 

    confirm: (review, cb) ->
      review.confirm cb

    reject: (review, cb) ->
      review.reject cb

    cancel: (review, cb) ->
      review.cancel cb