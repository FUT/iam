class Iam
  constructor: ->
    panel = $('<div id="sample-users-accounts"></div>')
    $(document.body).append panel
    for group in gon.global.iam.grouped_users
      list = $('<ul class="sample-users-role"></ul>')
      panel.append list
      for user in group
        userItem = $("<li class='sample-user' user_link='#{user.link}'>#{user.name}</li>")
        list.append userItem
        userItem.on 'click', ->
          $.post $(this).attr('user_link'), (response) ->
            if response.success == 'true'
              $('.it-is-me').removeClass 'it-is-me'
              userItem.addClass 'it-is-me'

$ ->
  new Iam
