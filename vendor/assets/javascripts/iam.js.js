(function(){$(function(){var e,t,n,r,i,s,o,u,a,f,l,c,h;return h="/iam/log_in_as/:id",l="/iam/menu",s=!1,i="",e=["alt","ctrl","shift"],r=function(){return $(".iam-settings-header").on("click",function(){return $(".iam-settings").toggle()}),$("#iam-menu").on("click","td",function(){var e,t;e=$(this).parents("tr"),t=e.attr("href");if(t)return f(t)}),$.each(e,function(){var e,t;return e=$(".iam-"+this+"-settings input"),t="iam-"+this+"-checked",e[0].checked=$.cookie(t)==="true",e.on("click",function(){return $.cookie(t,this.checked)})})},n=function(e){var t;return t=$("<div class='iam-notice'>"+e+"</div>"),$("body").append(t),t.fadeIn(200).delay(1e3).fadeOut(600)},f=function(e){return $.post(e,function(e){return window.location.reload(),n(e.notice)})},u=function(e){return String.fromCharCode(e)==="À"},t=function(t){var n,r,i,s;for(i=0,s=e.length;i<s;i++){n=e[i],r=$.cookie("iam-"+n+"-checked")==="true";if(r!==t[""+n+"Key"])return!1}return!0},o=function(){return $(document.getSelection().focusNode).find("input, textarea").length>0},c=function(e){var t;if(e.match(/^\d+$/))return t=h.replace(/:id/,e),f(t);if(e)return n(""+e+" is invalid id.")},a=function(){return s?c(i):$.get(l,function(e){return $("body").append(e),r()}),i=""},$(document).on("keydown",function(e){var n;if(!o()&&u(e.keyCode)&&t(e))return a(),s=!s,$("#iam-menu").remove();if(48<=(n=e.keyCode)&&n<=57)return i+=String.fromCharCode(e.keyCode)})})}).call(this);