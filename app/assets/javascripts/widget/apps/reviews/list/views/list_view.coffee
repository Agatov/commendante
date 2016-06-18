@WidgetApp.module "ReviewsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.ReviewView extends App.Views.ItemView
    template: "reviews/list/templates/review"
    className: "review"

    onRender: ->
      console.log @model.attributes

  class List.ReviewsListView extends App.Views.CollectionView
    className: "reviews"
    childView: List.ReviewView
    childViewEventPrefix: "list"
    emptyView: List.EmptyView
