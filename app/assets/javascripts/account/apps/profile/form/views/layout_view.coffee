@AccountApp.module "ProfileApp.Form", (Form, App, Backbone, Marionette, $, _) ->

  class Form.LayoutView extends App.Views.LayoutView
    template: "profile/form/templates/layout"

    regions:
      'formRegion': '.form-region'