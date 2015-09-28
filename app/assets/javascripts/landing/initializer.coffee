$ ->

  $(document).on "gr:widget:panel:opened", ->
    reachGoal "gr_widget_panel_opened"

  $(".question-box").on "click", ->
    $(@).addClass "opened"

  $("#live-demo-button").on "click", ->
    event = new CustomEvent("gr:widget:open")
    document.dispatchEvent event

window.reachGoal = (goal) ->
  yaCounter.reachGoal goal