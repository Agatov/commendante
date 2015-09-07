@AccountApp.module "OffersApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.LayoutView extends App.Views.LayoutView
    template: "offers/list/templates/layout"

    regions:
      'tableRegion': '.table-region'
      'formRegion': '.form-region'