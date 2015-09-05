@AccountApp.module "OptionsApp.Page", (Page, App, Backbone, Marionette, $, _) ->

  class Page.InstallView extends App.Views.ItemView
    template: "options/page/templates/install"
    tagName: 'section'

    events: 
      "click .copy-code-button": "copyCode"

    copyCode: ->
      document.querySelector(".code-widget").select()

      try
        document.execComand("copy")
      catch error

