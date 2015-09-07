@AccountApp.module "UsersApp.Form", (Form, App, Backbone, Marionette, $, _) ->

  class Form.FormView extends App.Views.FormOptional
    template: "users/form/templates/form"
    className: "options-form"

    bindings: 
      "input[name=name]": "name"
      "select[name=role]": "role"

    events:
      # События определены в App.View.FormOptional
      'change input[type=text]': 'onInputChange'
      'focus input[type=text]': 'onInputFocus'
      'focus select': 'onInputFocus'
      'click #js-send-one-more-invite': -> @trigger "invite:button:click", @model

    initialize: ->
      @model.on "change:role", => @onSelectChange($(@el).find("select[name=role]"))