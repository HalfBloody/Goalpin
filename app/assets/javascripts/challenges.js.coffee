

$(document).on "page:change", ->
  start_date = moment().endOf('day')
  end_date = moment().add(30, 'days')
  $('#challenge_start_date').val(start_date)
  
  selected_days = $(".day_button_box").data("initial")
  selected_ms = $(".milestones_box").data("initial")
  $("#" + selected_days + "_days").addClass("active")
  $("#" + selected_ms + "_times").addClass("active")
  
  $(".days").click ->
    days = $(this).data("days")
    end_date = moment(start_date)
    end_date.add(days, 'days')
    $('#challenge_end_date').val(end_date)
    $('.days').removeClass("active")
    $(this).addClass("active") 
    $(".milestones_box").fadeIn(600);

  $(".times").click ->
    times = $(this).data("times")      
    $('#challenge_number_of_milestones').val(times)
    $('.times').removeClass("active")
    $(this).addClass("active")
    $(".submit_box").fadeIn(600);
    
  $("#show_milestones").click ->
    if ($("#milestones").hasClass("hidden"))
      $("#milestones").removeClass("hidden")  
      $("#show_milestones").text("Hide milestones");
    else
      $("#milestones").addClass("hidden")  
      $("#show_milestones").text("All milestones");