$ ->


  $("#registration-step-1-button").on "click", ->

    hideErrors()

    username = $("input[name=username]").val()
    email = $("input[name=email]").val()
    password = $("input[name=password]").val()

    invalid_fields = []

    if username.length == 0
      invalid_fields.push {field: "username", msg: "Это поле обязательно для заполнения"}

    if email.length == 0
      invalid_fields.push {field: "email", msg: "Это поле обязательно для заполнения"}
    else if !validateEmail(email)
      invalid_fields.push {field: "email", msg: "Введите ваш настоящий email"}

    if password.length == 0
      invalid_fields.push {field: "password", msg: "Это поле обязательно для заполнения"}
    else if password.length < 6
      invalid_fields.push {field: "password", msg: "Придумайте пароль длиннее 6 символов"}


    if invalid_fields.length > 0
      render_validation_errors invalid_fields
      return false

    $.post(
      "/signup"
      {
        "user[name]": username
        "user[email]": email
        "user[password]": password
      }
      (data) ->
        if data.status == "error"
          invalid_fields.push {field: "email", msg: data.error}
          render_validation_errors invalid_fields
          return false

        if data.status == 'success'
          $("input").val ""
          $(".central-box.registration.step-1").hide()
          $(".central-box.registration.step-2").show()
    )

    


  $("#registration-step-2-button").on "click", ->

    hideErrors()

    company_name = $("input[name=company_name]").val()
    site_url = $("input[name=site_url]").val()
    widget_email = $("input[name=widget_email]").val()

    invalid_fields = []

    if company_name.length == 0
      invalid_fields.push {field: "company_name", msg: "Это поле обязательно для заполнения"}

    if site_url.length == 0
      invalid_fields.push {field: "site_url", msg: "Это поле обязательно для заполнения"}

    if widget_email.length == 0
      invalid_fields.push {field: "widget_email", msg: "Это поле обязательно для заполнения"}
    else if !validateEmail(widget_email)
      invalid_fields.push {field: "widget_email", msg: "Введите ваш настоящий email"}


    if invalid_fields.length > 0
      render_validation_errors invalid_fields
      return false

    request = $.ajax(
      url: "/account/widget"
      method: 'put'
      data:
        "widget[company_name]": company_name
        "widget[site_url]": site_url
        "widget[email]": widget_email   
    )

    request.done (msg) ->
      window.location.href = "/account#options"


  $("#send-authentication-form").on "click", ->

    hideErrors()

    email = $("input[name=email]").val()
    password = $("input[name=password]").val()

    invalid_fields = []

    if email.length == 0
      invalid_fields.push {field: "email", msg: "Это поле обязательно для заполнения"}
    else if !validateEmail(email)
      invalid_fields.push {field: "email", msg: "Введите ваш настоящий email"}

    if password.length == 0
      invalid_fields.push {field: "password", msg: "Это поле обязательно для заполнения"}

    if invalid_fields.length > 0
      render_validation_errors invalid_fields
      return false


    $.post(
      "/signin"
      {
        "user[email]": email
        "user[password]": password
      }
      (data) ->
        if data.status == "error"
          invalid_fields.push {field: "email", msg: data.error}
          render_validation_errors invalid_fields
          return false

        if data.status == 'success'
          window.location.href = "/account"
    )


  $("#change-password").on "click", ->

    hideErrors()

    password = $("input[name=password]").val()
    password_repeat = $("input[name=password_repeat").val()
    token = $("input[name=token]").val()

    invalid_fields = []

    if password.length == 0
      invalid_fields.push {field: "password", msg: "Это поле обязательно для заполнения"}

    if password_repeat.length == 0
      invalid_fields.push {field: "password_repeat", msg: "Это поле обязательно для заполнения"}

    if password != password_repeat
      invalid_fields.push {field: "password", msg: "Пароль и подтверждение не совпадают"}

    if invalid_fields.length > 0
      render_validation_errors invalid_fields
      return false

    request = $.ajax(
      url: "/change_password"
      method: 'post'
      data:
        "password": password
        "token": token
    )

    request.done (msg) ->
      if msg.status == "success"
        window.location.href = "/account#profile"
      else
        invalid_fields.push {field: "password", msg: msg.error}
        render_validation_errors invalid_fields
        return false

  $("#restore-password").on "click", ->
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

    request = $.ajax(
      url: "/restore_password"
      method: 'put'
      data:
        "email": email
    )

    request.done (data) ->
      if data.status == "success"
        $(".central-box.restore-password").hide()
        $(".central-box.password-email-sent").show()


      if data.status == "error"
        invalid_fields.push {field: "email", msg: data.error}
        render_validation_errors invalid_fields
        return false







window.render_validation_errors = (invalid_fields) ->
  render_validation_error(field) for field in invalid_fields

window.render_validation_error = (error) ->
  input = $("input[name=#{error.field}]")
  input.addClass "invalid"
  input.siblings(".error").show().text error.msg

window.hideErrors = ->
  $("input").removeClass "invalid"
  $(".error").hide().text null

window.validateEmail = (email) ->
  re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
  return re.test(email)
