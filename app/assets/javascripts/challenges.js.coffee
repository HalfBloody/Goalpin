# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
  start_date_text = $("#challenge_start_date").val()
  start_date = moment(start_date_text)

  $("#30_days").click ->
    $('#challenge_end_date').val(555)
    alert(start_date_text)
  