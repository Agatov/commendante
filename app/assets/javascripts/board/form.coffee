$ ->

  $("#save-review-button").on "click", ->
    if validateReview()
      saveReview()

  $("#change-review-button").on "click", ->
    hideResultWidget ->
      showFormWidget()

  window.saveReview = ->

    spinner = $("#save-review-button").spin('button', '#fff').data().spinner
    $("#save-review-button").text ""
    
    data = getData()

    request = $.ajax(
      url: "/review.json"
      type: $("input[name=request_type]").val()
      data: {
        "review[content]": data.content
        "review[rate]": data.rate
      }
    )

    request.done (data) ->
      spinner.stop()
      $("#save-review-button").text("Сохранить отзыв")

      if data.status == "success"
        $("input[name=request_type]").val "PUT"
        hideFormWidget ->
          renderResultWidget data.review
          showResultWidget()
          autosize.destroy $("textarea")
 
 window.renderResultWidget = (data) ->
  review = $(".result-widget .review")
  review.find(".reviewer-name").text data.reviewer_name
  review.find(".reviewer-url").text data.reviewer_url
  review.find(".review-date").text data.date
  review.find(".review-body").html decorateText(data.content)
  review.find(".reviewer-avatar img").attr "src", data.reviewer_avatar

  review.find(".review-rate-stars")
    .removeClass("one-star")
    .removeClass("two-stars")
    .removeClass("three-stars")
    .removeClass("four-stars")
    .removeClass("five-stars")

  review.find(".review-rate-stars").addClass getStarsClassByRate(data.rate)

window.showResultWidget = ->
  $(".result-widget").css("opacity", 0).show().animate({opacity: 1}, 300)

window.hideResultWidget = (cb) ->
  $(".result-widget").animate {opacity: 0}, 300, ->
    $(@).hide()
    cb()

window.showFormWidget = ->
  $(".form-widget").css("opacity", 0).show().animate({opacity: 1}, 300)

window.hideFormWidget = (cb) ->
  $(".form-widget").animate {opacity: 0}, 300, ->
    $(@).hide()
    cb()
