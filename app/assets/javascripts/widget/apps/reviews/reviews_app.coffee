@WidgetApp.module "ReviewsApp", (ReviewsApp, App, Backbone, Marionette, $, _) ->


  API =

    showList: ->
      ReviewsApp.List.Controller.show()


  App.vent.on "show:reviews", ->
    API.showList()

  ReviewsApp.on "start", ->
    API.showList()