$ ->

  $(".button.add-review").on "click", ->
    $(".modal-overlay").addClass "visible"
    $(".auth-modal").addClass "visible"

  $(".modal-overlay").on "click", ->
    $(".modal-overlay").removeClass "visible"
    $(".modal").removeClass "visible"

  $(".submit-reply").on "click", ->

    title = $("input[name=title]").val()
    content = $("textarea[name=content]").val()

    invalid_fields = []

    if title.length == 0
      invalid_fields.push {field: "title", msg: "Это поле обязательно для заполнения"}

    if content.length == 0
      invalid_fields.push {field: "content", msg: "Это поле обязательно для заполнения"}

    if invalid_fields.length > 0
      render_validation_errors invalid_fields
      return false



    positive = ($(@).attr("opinion") == "positive") ? true : false
    $.post(
      "/reviews",
      {
        "review[title]": title,
        "review[content]": content,
        "review[positive]": positive
      },
      (data) ->
        $(".review-form-modal").removeClass "visible"
        $(".thank-you-modal").addClass "visible"

    )
    

window.render_validation_errors = (invalid_fields) ->

  render_validation_error(field) for field in invalid_fields

window.render_validation_error = (field) ->
  console.log "!!!"
  block = $(".input-block.#{field.field}")
  block.addClass "invalid"
  block.find(".input-validation-error").text field.msg