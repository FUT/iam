$ ->
  $menu = $('#iam-menu')
  linkTemplate = $menu.attr 'href'
  inputMode = false # account id is anticipated to be typed
  input = '' # typed string
  controlKeys = ['alt', 'ctrl', 'shift']

  iamNotice = (notice) ->
    $notice = $("<div class='iam-notice'>#{notice}</div>")
    $('body').append $notice
    $notice.fadeIn(200).delay(1000).fadeOut 600

  logInByLink = (link) ->
    $.post link, (data) ->
      $menu.hide()
      window.location.reload()
      iamNotice data.notice

  isTilde = (code) ->
    String.fromCharCode(code) == 'À' # tilde with any control key (alt shift ctrl)

  controlKeysMatch = (e) ->
    for key in controlKeys
      checkBox = $(".iam-#{key}-settings input")[0]
      return false if checkBox.checked != e["#{key}Key"]
    true

  inputSelected = ->
    $(document.getSelection().focusNode).find('input, textarea').length > 0

  processInput = (input) ->
    if input.match(/^\d+$/)
      link = linkTemplate.replace(/ID/, input)
      logInByLink link
    else
      iamNotice "#{input} is invalid id." if input

  logInByInput = ->
    processInput input if inputMode
    input = ''

  $menu.on 'click', 'td', ->
    $tr = $(@).parents 'tr'
    link = $tr.attr 'href'
    logInByLink link if link

  $(document).on 'keydown', (e) ->
    if !inputSelected() && isTilde(e.keyCode) && controlKeysMatch(e)
      logInByInput()

      inputMode = !inputMode
      $menu.toggle()
    else
      input += String.fromCharCode e.keyCode if 48 <= e.keyCode <= 57

  $.each controlKeys, ->
    $checkbox = $(".iam-#{@}-settings input")
    cookieName = "iam-#{@}-checked"

    $checkbox[0].checked = $.cookie(cookieName) == 'true'

    $checkbox.on 'click', -> $.cookie cookieName, @.checked
