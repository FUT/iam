$ ->
  $menu = $('#iam-menu')
  $menu.on 'click', 'td', ->
    $tr = $(@).parents 'tr'
    link = $tr.attr 'href'
    if link
      $.ajax link, (data) ->
        console.log data


  $(document).on 'keydown', (e) ->
    if e.keyCode == 192 # '`'
      $menu.toggle()

