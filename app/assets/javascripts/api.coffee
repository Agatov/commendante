$ ->

  Commendante.API.initialize Commendante.WidgetUID, (data) ->
    Commendante.Data = data

    cmdtWidgetButton = document.createElement("div")
    $(cmdtWidgetButton).addClass "cmdt-widget-button"
    $(cmdtWidgetButton).html "<div class = 'cmdt-button-reviews-count'>#{Commendante.Data.reviews_count}</div> #{Commendante.Data.reviews_count_text}"

    cmdtOverlay = document.createElement("div")
    $(cmdtOverlay).addClass("cmdt-overlay")

    cmdtCloseOverlayButton = document.createElement("div")
    $(cmdtCloseOverlayButton).addClass "cmdt-close-overlay-icon"

    cmdtPanel = document.createElement("div")
    $(cmdtPanel).addClass("cmdt-widget-panel")

    cmdtPanelContainer = document.createElement("div")
    $(cmdtPanelContainer).addClass "cmdt-widget-panel-container"

    $("body").append cmdtOverlay
    $("body").append cmdtCloseOverlayButton
    $("body").append cmdtPanel
    $("body").append cmdtWidgetButton

    $(".cmdt-widget-panel").append cmdtPanelContainer

    if Commendante.Data.reviews_count == 0
      $(".cmdt-widget-panel").addClass "cmdt-widget-panel-empty"
      $(".cmdt-widget-panel-container").append(Commendante.API.renderEmpty(Commendante.Data))
    else
      $(".cmdt-widget-panel-container").append(Commendante.API.renderReviewsTop(Commendante.Data))
      $(".cmdt-widget-panel-container").append(Commendante.API.renderReviewsHeader(Commendante.Data))
      $(".cmdt-widget-panel-container").perfectScrollbar()


      reviewsRoot = document.createElement("div")
      $(reviewsRoot).addClass "cmdt-reviews"


      $(reviewsRoot).append(Commendante.API.renderReview(reviewData)) for reviewData in Commendante.Data.reviews
      $(".cmdt-widget-panel-container").append reviewsRoot

    $(cmdtWidgetButton).on "click", -> Commendante.API.showPanel()
    $(cmdtCloseOverlayButton).on "click", -> Commendante.API.hidePanel()
    $(cmdtOverlay).on "click", -> Commendante.API.hidePanel()

Commendante.API = 

  showPanel: ->
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


  hidePanel: ->
    overlay = $(".cmdt-overlay")
    overlay.animate {opacity: "0"}, 300, -> overlay.hide()

    closeIcon = $(".cmdt-close-overlay-icon")
    closeIcon.animate {top: "-40px", opacity: 0}, 300, -> closeIcon.hide()

    panel = $(".cmdt-widget-panel")
    panel.animate {"left": "-520px", "opacity": 0}, 300, -> panel.hide()


  renderEmpty: (data) ->
    """
      <div class ="cmdt-widget-panel-empty-box">
        <div class = "cmdt-widget-panel-empty-title">
          Увы, никто еще не написал ни одного отзыва,
          но вы можете быть первым!
        </div>
        <a href = "#{data.review_board_url}"  class = "cmdt-button" target = "_blank">Написать первый отзыв</a>
      </div>
    """


  renderReviewsTop: (data) ->
    """
      <div class = "cmdt-widget-top">
        <a href = "#{data.review_board_url}" class = "cmdt-button" target = "_blank"> Написать свой отзыв </a>
      </div>
    """

  renderReviewsHeader: (data) ->
    """
      <div class ="cmdt-reviews-header">
        <div class = "cmdt-reviews-total-rate">
          <div class = "cmdt-reviews-total-rate-stars #{Commendante.API.getStarsClassByRate(data.average_rate_rounded)}"></div>
        </div>
        <div class = "cmdt-reviews-total-count">
          #{data.reviews_count} #{data.reviews_count_text} о компании</div>
        <div class = "cmdt-reviews-company-name">«#{data.company_name}»</div>
      </div>
    """

  renderReview: (data) ->
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
            <div class ="cmdt-review-rate-stars #{Commendante.API.getStarsClassByRate(data.rate)}"></div>
            <div class = "cmdt-review-date">#{data.date}</div>
          </div>

        </div>

        <div class = "cmdt-review-body">
          #{Commendante.API.decorateText(data.content)}
        </div>
      </div>
    """

  initialize: (widget, cb) ->

    $.get(
      "http://localhost:3000/api/reviews/#{widget}.json", 
      (data) ->
        if data.status = "success"
          cb(data)
    )

  getStarsClassByRate: (rate) ->
    switch rate
      when 1 then return "one-star"
      when 2 then return "two-stars"
      when 3 then return "three-stars"
      when 4 then return "four-stars"
      when 5 then return "five-stars"

  decorateText: (str) ->
    lines = str.replace(/[\r\n]+/g, '\n').split("\n")
    "<p>" + lines.join("</p><p>") + "</p>"


