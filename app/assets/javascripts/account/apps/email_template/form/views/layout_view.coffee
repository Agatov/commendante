@AccountApp.module "EmailTemplateApp.Form", (Form, App, Backbone, Marionette, $, _) ->


  class Form.LayoutView extends App.Views.LayoutView
    template: "email_template/form/templates/layout"

    regions: 
      'formRegion': '.form-region'