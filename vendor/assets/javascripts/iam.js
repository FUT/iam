// Generated by CoffeeScript 1.3.3
(function() {

  $(function() {
    var $menu, controlKeys, controlKeysMatch, iamNotice, input, inputMode, inputSelected, isTilde, linkTemplate, logInByInput, logInByLink, processInput;
    $menu = $('#iam-menu');
    linkTemplate = $menu.attr('href');
    inputMode = false;
    input = '';
    controlKeys = ['alt', 'ctrl', 'shift'];
    iamNotice = function(notice) {
      var $notice;
      $notice = $("<div class='iam-notice'>" + notice + "</div>");
      $('body').append($notice);
      return $notice.fadeIn(200).delay(1000).fadeOut(600);
    };
    logInByLink = function(link) {
      return $.post(link, function(data) {
        $menu.hide();
        window.location.reload();
        return iamNotice(data.notice);
      });
    };
    isTilde = function(code) {
      return String.fromCharCode(code) === 'À';
    };
    controlKeysMatch = function(e) {
      var checkBox, key, _i, _len;
      for (_i = 0, _len = controlKeys.length; _i < _len; _i++) {
        key = controlKeys[_i];
        checkBox = $(".iam-" + key + "-settings input")[0];
        if (checkBox.checked !== e["" + key + "Key"]) {
          return false;
        }
      }
      return true;
    };
    inputSelected = function() {
      return $(document.getSelection().focusNode).find('input, textarea').length > 0;
    };
    processInput = function(input) {
      var link;
      if (input.match(/^\d+$/)) {
        link = linkTemplate.replace(/ID/, input);
        return logInByLink(link);
      } else {
        if (input) {
          return iamNotice("" + input + " is invalid id.");
        }
      }
    };
    logInByInput = function() {
      if (inputMode) {
        processInput(input);
      }
      return input = '';
    };
    $menu.on('click', 'td', function() {
      var $tr, link;
      $tr = $(this).parents('tr');
      link = $tr.attr('href');
      if (link) {
        return logInByLink(link);
      }
    });
    $(document).on('keydown', function(e) {
      var _ref;
      if (!inputSelected() && isTilde(e.keyCode) && controlKeysMatch(e)) {
        logInByInput();
        inputMode = !inputMode;
        return $menu.toggle();
      } else {
        if ((48 <= (_ref = e.keyCode) && _ref <= 57)) {
          return input += String.fromCharCode(e.keyCode);
        }
      }
    });
    return $.each(controlKeys, function() {
      var $checkbox, cookieName;
      $checkbox = $(".iam-" + this + "-settings input");
      cookieName = "iam-" + this + "-checked";
      $checkbox[0].checked = $.cookie(cookieName) === 'true';
      return $checkbox.on('click', function() {
        return $.cookie(cookieName, this.checked);
      });
    });
  });

}).call(this);