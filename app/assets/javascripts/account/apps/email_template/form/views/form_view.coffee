@AccountApp.module "EmailTemplateApp.Form", (Form, App, Backbone, Marionette, $, _) ->

  class Form.FormView extends App.Views.FormOptional
    template: "email_template/form/templates/form"
    tagName: 'section'

    bindings: 
      'input[name=subject]': 'subject'
      'textarea[name=body]': 'body'

    events:
      'change input[type=text]': 'onInputChange'
      'focus input[type=text]': 'onInputFocus'
      'change textarea': 'onInputChange'
      'focus textarea': 'onInputFocus'