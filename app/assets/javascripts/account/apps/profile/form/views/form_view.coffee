@AccountApp.module "ProfileApp.Form", (Form, App, Backbone, Marionette, $, _) ->

  class Form.FormView extends App.Views.FormOptional
    template: "profile/form/templates/form"
    className: "options-form"

    bindings: 
      "input[name=name]": "name"
      "select[name=role]": "role"

    events:
      # События определены в App.View.FormOptional
      'change input[type=text]': 'onInputChange'
      'focus input[type=text]': 'onInputFocus'
      'focus select': 'onInputFocus'
      'click #js-send-confirmation-email': -> @trigger "send:confirmation:button:click"
      'click #js-send-change-passoword-email': -> @trigger "change:password:button:click"