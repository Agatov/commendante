@AccountApp.module "UsersApp.Form", (Form, App, Backbone, Marionette, $, _) ->

  class Form.LayoutView extends App.Views.LayoutView
    template: "users/form/templates/layout"

    regions:
      'formRegion': '.form-region'

    events: 
      "click #js-go-back": -> @trigger "go:back:button:click"
      "click #js-delete-user": -> @trigger "delete:user:button:click", @model