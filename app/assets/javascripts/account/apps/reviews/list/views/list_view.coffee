@AccountApp.module "ReviewsApp.List", (List, App, Backbone, Marionette, $, _) ->


  class List.ReviewView extends App.Views.ItemView
    template: "reviews/list/templates/review"
    className: "review"

    events:
      "click .button[behavior=confirm]": -> @trigger "confirm:button:click", @model
      "click .button[behavior=reject]": -> @trigger "reject:button:click", @model
      "click .button[behavior=cancel]": -> @trigger "cancel:button:click", @model

    onBeforeRender: ->
      @decorateContent()

    decorateContent: ->
      lines = @model.get("content").replace(/[\r\n]+/g, '\n').split("\n")
      @model.set "content", "<p>" + lines.join("</p><p>") + "</p>"


  class List.EmptyView extends App.Views.ItemView
    template: "reviews/list/templates/empty"
    className: "empty-view"



  class List.ReviewsListView extends App.Views.CollectionView
    className: "reviews"
    childView: List.ReviewView
    childViewEventPrefix: "list"
    emptyView: List.EmptyView