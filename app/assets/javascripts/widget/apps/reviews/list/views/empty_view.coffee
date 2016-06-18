@WidgetApp.module "ReviewsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.EmptyView extends App.Views.ItemView
    template: "reviews/list/templates/empty"