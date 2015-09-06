@AccountApp.module "ReviewsApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    show: (type = null) ->
      layoutView = @getLayoutView type
      App.mainRegion.show layoutView

      App.request "entities:reviews", type, (reviews) =>
        listView = @getListView reviews
        layoutView.reviewsRegion.show listView



    getLayoutView: (type) ->
      layoutView = new List.LayoutView
        model: (new Backbone.Model({type: type}))

      layoutView

    getListView: (reviews) ->
      listView = new List.ReviewsListView
        collection: reviews

      listView.on "list:confirm:button:click", (iv, review) =>
        App.vent.trigger "confirm:review", review, => @onReviewModerate(iv)

      listView.on "list:reject:button:click", (iv, review) =>
        App.vent.trigger "reject:review", review, => @onReviewModerate(iv)

      listView.on "list:cancel:button:click", (iv, review) =>
        App.vent.trigger "cancel:review", review, => @onReviewModerate(iv)
          

      listView

    onReviewModerate: (reviewView) ->
      App.request("get:widget").fetch
        success: ->
          App.vent.trigger "sidebar:refresh:reviews:stats"
          reviewView.render()