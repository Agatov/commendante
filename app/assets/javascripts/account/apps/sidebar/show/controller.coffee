@AccountApp.module "SidebarApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    show: ->

      widget = App.request "get:widget"

      layoutView = @getLayoutView widget
      App.sidebarRegion.show layoutView

    getLayoutView: (widget) ->

      view = new Show.LayoutView
        model: widget

      view.on "navigation:link:click", (options) ->
        console.log options.trigger
        App.vent.trigger options.trigger


      App.vent.on "sidebar:refresh:reviews:stats", ->
        view.refreshReviewsStats()

      view


