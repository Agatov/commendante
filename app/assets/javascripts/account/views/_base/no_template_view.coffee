@AccountApp.module "Views", (Views, App, Backbone, Marionette, $, _) ->
  
  class Views.NoTemplateView extends Marionette.ItemView
    _renderTemplate: ->
      