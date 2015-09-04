$ ->

  cmdtInitialize "ya.ru", 5, (data) ->
    window.cmdtData = data

    cmdtWidgetButton = document.createElement("div")
    $(cmdtWidgetButton).addClass "cmdt-widget-button"
    $(cmdtWidgetButton).text "#{cmdtData.reviews_count} отзывов"



    cmdtOverlay = document.createElement("div")
    $(cmdtOverlay).addClass("cmdt-overlay")

    cmdtCloseOverlayButton = document.createElement("div")
    $(cmdtCloseOverlayButton).addClass "cmdt-close-overlay-icon"

    cmdtPanel = document.createElement("div")
    $(cmdtPanel).addClass("cmdt-widget-panel")

    $("body").append cmdtOverlay
    $("body").append cmdtCloseOverlayButton
    $("body").append cmdtPanel
    $("body").append cmdtWidgetButton

    $(".cmdt-widget-panel").append(renderReviewsTop(cmdtData))
    $(".cmdt-widget-panel").append(renderReviewsHeader(cmdtData))


    reviewsRoot = document.createElement("div")
    $(reviewsRoot).addClass "cmdt-reviews"


    $(reviewsRoot).append(renderReview(reviewData)) for reviewData in cmdtData.reviews
    $(".cmdt-widget-panel").append reviewsRoot

    $(cmdtWidgetButton).on "click", -> showCmdtPanel()
    $(cmdtCloseOverlayButton).on "click", -> hideCmdtPanel()




window.showCmdtPanel = ->
  overlay = $(".cmdt-overlay")
  overlay.css "opacity", 0
  overlay.show()
  overlay.animate({opacity: "0.8"}, 300)


  closeIcon = $(".cmdt-close-overlay-icon")
  closeIcon.css "top", "-40px"
  closeIcon.css "opacity", "0"
  closeIcon.show()
  closeIcon.animate {top: "30px", opacity: 1}, 300


  panel = $(".cmdt-widget-panel")
  panel.css("left", "-520px")
  panel.css "opacity", 0
  panel.show()
  panel.animate({"left": "0px", "opacity": 1}, 300)


window.hideCmdtPanel = ->
  overlay = $(".cmdt-overlay")
  overlay.animate {opacity: "0"}, 300, -> overlay.hide()

  closeIcon = $(".cmdt-close-overlay-icon")
  closeIcon.animate {top: "-40px", opacity: 0}, 300, -> closeIcon.hide()

  panel = $(".cmdt-widget-panel")
  panel.animate {"left": "-520px", "opacity": 0}, 300, -> panel.hide()




window.renderReviewsTop = (data) ->
  """
    <div class = "cmdt-widget-top">
      <a href = "#" class = "cmdt-button"> Написать свой отзыв </a>
    </div>
  """

window.renderReviewsHeader = (data) ->
  """
    <div class ="cmdt-reviews-header">
      <div class = "cmdt-reviews-total-count">27 реальных отзывов</div>
      <div class = "cmdt-reviews-total-rate">
          <div class = "cmdt-reviews-total-rate-stars five-stars"></div>
          <div class = "cmdt-reviews-total-rate-value">(4.6)</div>
        </div>
    </div>
  """

window.renderReview = (data) ->
  """
    <div class = "cmdt-review">
      <div class = "cmdt-review-header">
        <div class = "cmdt-review-author-avatar">
          <img src = "#{data.avatar}">
        </div>

        <div class = "cmdt-review-author-details">
          <div class = "cmdt-review-author-name">#{data.username}</div>
          <div class = "cmdt-review-author-url">
            <a href = "#{data.user_url}" target = "_blank">#{data.user_url}</a>
          </div>

        </div>

        <div class = "cmdt-review-right">
          <div class ="cmdt-review-rate-stars four-stars"></div>
          <div class = "cmdt-review-date">#{data.date}</div>
        </div>

      </div>

      <div class = "cmdt-review-body">
        #{data.content}
      </div>
    </div>
  """

window.cmdtInitialize = (url, limit, cb) ->

  $.get(
    "http://localhost:3000/api/reviews?url=#{url}", 
    (data) ->
      if data.status = "success"
        cb(data)
  )