@WidgetApp.module "ReviewsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.LayoutView extends App.Views.LayoutView
    template: "reviews/list/templates/layout"

    regions:
      'listRegion': '.list-region'

    onRender: ->
      console.log @model.attributes