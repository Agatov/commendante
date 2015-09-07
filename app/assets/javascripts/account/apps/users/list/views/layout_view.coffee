@AccountApp.module "UsersApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.LayoutView extends App.Views.LayoutView
    template: "users/list/templates/layout"

    regions:
      'tableRegion': '.table-region'
      'formRegion': '.form-region'