@AccountApp.module "OptionsApp.Page", (Page, App, Backbone, Marionette, $, _) ->

  class Page.LayoutView extends App.Views.LayoutView
    template: "options/page/templates/layout"

    regions: 
      'installRegion': '.install-region'
      'formRegion': '.form-region'