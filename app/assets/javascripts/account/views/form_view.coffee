 @AccountApp.module "Views", (Views, App, Backbone, Marionette, $, _) ->

  class Views.FormView extends App.Views.ItemView
    className: 'form'

    
    initialize: ->
      fv = new App.Views.Mixins.FormView
      _.extend @, fv  

      @initializeFormView()

    onShow: ->
      @stickit()