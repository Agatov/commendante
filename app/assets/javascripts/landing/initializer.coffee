$ ->

  $(document).on "gr:widget:panel:opened", ->
    reachGoal "gr_widget_panel_opened"

  $(".question-box").on "click", ->
    $(@).addClass "opened"

  $("#live-demo-button").on "click", ->
    $(document).trigger "gr:widget:open"

window.reachGoal = (goal) ->
  yaCounter.reachGoal goal