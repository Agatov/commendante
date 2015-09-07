@AccountApp.module "OffersApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller = 

    show: ->
      layoutView = @getLayoutView()
      formView = @getFormView()

      App.request "entities:offers", (offers) =>
        tableView = @getTableView offers

        App.mainRegion.show layoutView
        layoutView.tableRegion.show tableView
        layoutView.formRegion.show formView


    getLayoutView: ->
      view = new List.LayoutView
      view

    getFormView: ->
      view = new List.FormView
        model: App.request "entities:offer:new"

      view.on "valid:form:submit", (offer) ->
        App.vent.trigger "save:offer", offer, ->
          view.model = App.request "entities:offer:new"
          view.render()
          App.request("entities:offers:loaded").unshift offer
          App.vent.trigger "show:alert",
            type: "success"
            content: "Предложение отправлено"



      view

    getTableView: (offers) ->
      view = new List.TableView
        collection: offers

      view.on "list:offer:click", (iv, offer) ->
        App.vent.trigger "show:offer:form", offer.get('id')

      view