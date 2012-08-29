class Iam
  constructor: ->
    createSkillet
    stylize

  createSkillet: ->
    panel = $('<div id="sample-users-accounts"></div>')
    $(document.body).append panel
    for group in gon.global.grouped_users
      list = $('<ul class="sample-users-role"></ul>')
      panel.append list
      for user in group
        userItem = $("<li class='sample-user'>#{user.name}</li>")
        list.append userItem
        userItem.on 'click', ->
          $.json user.link, (response) ->
            if response.success == 'true'
              $('.it-is-me').removeClass 'it-is-me'
              userItem.addClass 'it-is-me'

  stylize: ->

$ ->
  new Iam
