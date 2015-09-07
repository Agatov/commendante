@AccountApp.module "MassOfferTasksApp.Form", (Form, App, Backbone, Marionette, $, _) ->

  class Form.LayoutView extends App.Views.LayoutView
    template: "mass_offer_tasks/form/templates/layout"

    regions: 
      'formRegion': '.form-region'