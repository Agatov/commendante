@WidgetApp.module "ReviewsApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    show: ->
      App.request "entities:reviews", App.request("current:widget"), (reviews) =>

        layoutView = @getLayoutView App.request("current:widget")
        listView = @getListView reviews

        App.mainRegion.show layoutView
        layoutView.listRegion.show listView



    getLayoutView: (widget) ->
      view = new List.LayoutView
        model: widget

      view

    getListView: (reviews) ->
      list = new List.ReviewsListView
        collection: reviews

      list


