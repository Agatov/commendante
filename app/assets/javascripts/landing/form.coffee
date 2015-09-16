$ ->

  $("#submit-form").on "click", ->
    hideErrors()
    email = $("input[name=email]").val()

    invalid_fields = []

    if email.length == 0
      invalid_fields.push {field: "email", msg: "Это поле обязательно для заполнения"}
    else if !validateEmail(email)
      invalid_fields.push {field: "email", msg: "Введите ваш настоящий email"}

    if invalid_fields.length > 0
      render_validation_errors invalid_fields
      return false

    $.post(
      "/signup_short"
      {
        "user[email]": email
      }
      (data) ->
        if data.status == "error"
          invalid_fields.push {field: "email", msg: data.error}
          render_validation_errors invalid_fields
          return false

        if data.status == 'success'
          reachGoal "registration"
          window.location.href = "/account#options"
    )

window.render_validation_errors = (invalid_fields) ->
  render_validation_error(field) for field in invalid_fields

window.render_validation_error = (error) ->
  input = $("input[name=#{error.field}]")
  input.addClass "invalid"
  #input.siblings(".error").show().text error.msg

window.hideErrors = ->
  $("input").removeClass "invalid"
  #$(".error").hide().text null

window.validateEmail = (email) ->
  re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
  return re.test(email)