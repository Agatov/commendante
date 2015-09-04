@AccountApp.module "OptionsApp.Page", (Page, App, Backbone, Marionette, $, _) ->

  class Page.InstallView extends App.Views.ItemView
    template: "options/page/templates/install"
    tagName: 'section'