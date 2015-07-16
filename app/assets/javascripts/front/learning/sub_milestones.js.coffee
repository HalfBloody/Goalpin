# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'page:change', ->
  $(".select_sub_milestone_days").change ->
    $(this).data('days', $(this).val())
    days = $(this).data('days')
    sub_milestone_id = 'milestone_' + $(this).data('id') + '_days_text'
    
    update_milestone_days(days, sub_milestone_id)
    
    url = $(this).data('url')
    update_sub_milestone(url, days)


    milestone_id = 'milestone_' + $(this).data('parent-id')
    current_milestone = $('#' + milestone_id)
    sub_milestones = current_milestone.find($('.select_sub_milestone_days'))
    milestone_days = 0
    $(sub_milestones).each (index, elem) ->
      milestone_days += parseInt($(elem).data('days'))
    milestone_days_id = milestone_id + '_days'
    update_milestone_days(milestone_days, milestone_days_id)  

  # <!-- get_parent_milestone = (sub_milestone_id) ->

  # sum_sub_milestones_days = (milestone_id) ->  -->

  update_sub_milestone = (url, days) ->
    $.ajax
      url: url
      method: 'PATCH'
      dataType: 'script'
      data: { days: days },

  update_milestone_days = (days, id) ->
    $('#' + id).html('Planned for ' + String(days) + ' days')

  $(".select_sub_milestone_days").click ->
