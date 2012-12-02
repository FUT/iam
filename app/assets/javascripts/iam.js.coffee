$ ->
  $menu = $('#iam-menu')
  $menu.on 'click', 'td', ->
    $tr = $(@).parents 'tr'
    link = $tr.attr 'href'
    if link
      $.post link, (data) ->
        $menu.hide()
        $notice = $(data.notice)
        $('body').append $notice
        $notice.fadeIn(300).delay(1000).fadeOut 600


  $(document).on 'keydown', (e) ->
    if e.keyCode == 192 # '`'
      $menu.toggle()

