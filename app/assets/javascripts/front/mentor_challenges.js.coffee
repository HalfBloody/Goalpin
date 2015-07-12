

$(document).on "page:change", ->


  $("#show_message_dialog").click ->
    if ($("#message_dialog").hasClass("hidden"))
      $("#message_dialog").removeClass("hidden")
      $("#show_message_dialog").text("hide dialog")
    else
      $("#message_dialog").addClass("hidden")
      $("#show_message_dialog").text("Send a message")