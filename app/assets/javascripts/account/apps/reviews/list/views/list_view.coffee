@AccountApp.module "ReviewsApp.List", (List, App, Backbone, Marionette, $, _) ->


  class List.ReviewView extends App.Views.ItemView
    template: "reviews/list/templates/review"
    className: "review"

    events:
      "click .button[behavior=confirm]": -> @trigger "confirm:button:click", @model
      "click .button[behavior=reject]": -> @trigger "reject:button:click", @model
      "click .button[behavior=cancel]": -> @trigger "cancel:button:click", @model



  class List.ReviewsListView extends App.Views.CollectionView
    className: "reviews"
    childView: List.ReviewView
    childViewEventPrefix: "list"