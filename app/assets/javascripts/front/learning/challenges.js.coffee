# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on "page:change", ->
  $("#challenge_name").focus( -> $(".challenge_description").removeClass("hidden"))
  $("#challenge_description").focus( -> $(".submit_button").removeClass("hidden"))
     