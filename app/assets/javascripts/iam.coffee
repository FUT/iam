$ ->
  templateLink = '/iam/log_in/:id'
  logOutLink = '/iam/log_out/:id'
  menuLink = '/iam/menu'
  inputMode = false # account id is anticipated to be typed
  input = '' # typed string
  controlKeys = ['alt', 'ctrl', 'shift']

  initialize = ->
    $('.iam-settings-header').on 'click', ->
      $('.iam-settings').toggle()

    $('#iam-menu').on 'click', 'td.attribute', ->
      $tr = $(@).parents 'tr'
      link = $tr.attr 'href'
      logInByLink link if link

    $('#iam-menu tr.sign-out').on 'click', ->
      link = $(this).attr 'href'
      logOutByLink link if link

    $.each controlKeys, ->
      $checkbox = $(".iam-#{@}-settings input")
      cookieName = "iam-#{@}-checked"

      $checkbox[0].checked = $.cookie(cookieName) == 'true'

      $checkbox.on 'click', -> $.cookie cookieName, @.checked

  iamNotice = (notice) ->
    $notice = $("<div class='iam-notice'>#{notice}</div>")
    $('body').append $notice
    $notice.fadeIn(200).delay(1000).fadeOut 600

  logInByLink = (link) ->
    $.post link, (data) ->
      window.location.reload()
      iamNotice data.notice

  logOutByLink = (link) ->
    $.ajax
      url: link,
      type: 'DELETE',
      success: (data) ->
        window.location.reload()
        iamNotice data.notice

  isTilde = (code) ->
    tilde_codes = [192, 221]
    code in tilde_codes

  controlKeysMatch = (e) ->
    for key in controlKeys
      keyOn = $.cookie("iam-#{key}-checked") == 'true'
      return false if keyOn != e["#{key}Key"]
    true

  inputSelected = ->
    $(document.getSelection().focusNode).find('input, textarea').length > 0

  processInput = (input) ->
    if input.match(/^\d+$/)
      link = templateLink.replace(/:id/, input)
      logInByLink link
    else
      iamNotice "#{input} is invalid id." if input

  logInByInput = ->
    if inputMode
      processInput input
    else
      $.get menuLink, (menu) ->
        $('body').append menu
        initialize()

    input = ''

  $(document).on 'keydown', (e) ->
    if !inputSelected() && isTilde(e.keyCode) && controlKeysMatch(e)
      logInByInput()

      inputMode = !inputMode
      $('#iam-menu').remove()
    else
      input += String.fromCharCode e.keyCode if 48 <= e.keyCode <= 57
