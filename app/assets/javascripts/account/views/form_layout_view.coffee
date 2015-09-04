 @AccountApp.module "Views", (Views, App, Backbone, Marionette, $, _) ->

  class Views.FormLayoutView extends App.Views.LayoutView

    regions: 
      'formRegion': '.form-region'

    triggers: 
      'click .button.delete': "delete:button:click"
      "click .back-button": "back:button:click"
