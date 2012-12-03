$ ->
  $menu = $('#iam-menu')
  linkTemplate = $menu.attr 'href'
  inputMode = false
  input = ''

  iamNotice = (notice) ->
    $notice = $("<div class='iam-notice'>#{notice}</div>")
    $('body').append $notice
    $notice.fadeIn(200).delay(1000).fadeOut 600

  log_in_by_link = (link) ->
    $.post link, (data) ->
      $menu.hide()
      iamNotice data.notice
      window.location.reload()

  log_in_by_input = ->
    if inputMode
      if input.match(/^\d+$/)
        link = linkTemplate.replace(/ID/, input)
        log_in_by_link link
      else
        iamNotice "#{input} is invalid id." if input
    input = ''

  $menu.on 'click', 'td', ->
    $tr = $(@).parents 'tr'
    link = $tr.attr 'href'
    if link
      log_in_by_link link
      inputMode = false
      input = ''

  $(document).on 'keypress', (e) ->
    if e.keyCode == 96 || e.keyCode == 1105 # '`' || 'ё'
      log_in_by_input()

      inputMode = !inputMode
      $menu.toggle()
    else
      input += String.fromCharCode e.keyCode
