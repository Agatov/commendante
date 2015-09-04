@AccountApp.module "OptionsApp.Page", (Page, App, Backbone, Marionette, $, _) ->

  class Page.FormView extends App.Views.ItemView
    template: "options/page/templates/form"
    tagName: 'section'

    bindings: 
      'input[name=company_name]': 'company_name'
      'input[name=site_url]': 'site_url'
      'input[name=email]': 'email'

    events:
      'change input[type=text]': 'onInputChange'
      'focus input[type=text]': 'onInputFocus'

    onShow: ->
      @stickit()

    onInputChange: (e) ->
      $(e.target).attr "disabled", true
      @trigger "form:state:changed", @model, e.target

    fieldUpdated: (element) ->
      $(element).removeAttr "disabled"
      $(element).parent().find("label").addClass "update-success"

    onInputFocus: (e) ->
      $(e.target).parent().find("label").removeClass "update-success"