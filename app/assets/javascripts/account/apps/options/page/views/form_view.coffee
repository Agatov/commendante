@AccountApp.module "OptionsApp.Page", (Page, App, Backbone, Marionette, $, _) ->

  class Page.FormView extends App.Views.FormOptional
    template: "options/page/templates/form"
    tagName: 'section'

    bindings: 
      'input[name=company_name]': 'company_name'
      'input[name=site_url]': 'site_url'
      'input[name=email]': 'email'
      'input[name=reviews_count_for_show]': 'reviews_count_for_show'
      'input[name=hide_reviews_date]': 'hide_reviews_date'


    events:
      'change input[type=text]': 'onInputChange'
      'focus input[type=text]': 'onInputFocus'

    initialize: ->
      @model.on "change:hide_reviews_date", => @onCheckboxChange($(@el).find("input[name=hide_reviews_date]"))