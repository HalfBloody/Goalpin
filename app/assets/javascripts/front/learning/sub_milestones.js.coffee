# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'page:change', ->
  $(".days_select").change ->
    $(this).data('days', $(this).val())
    days = $(this).data('days')
    sub_milestone_id = $(this).parents('.sub_milestone').attr('id')
    
    updateMilestoneDays(days, sub_milestone_id)
    
    url = $(this).data('url')
    updateSubMilestone(url, days)


    milestone_id = $(this).parents('.milestone').attr('id')
    
    milestone_days = sumMilestoneDays(milestone_id)
    updateMilestoneDays(milestone_days, milestone_id)  

  # <!-- get_parent_milestone = (sub_milestone_id) ->  -->

  sumMilestoneDays = (milestone_id) ->
    sub_milestones = $('#' + milestone_id).find($('.days_select'))
    milestone_days = 0
    $(sub_milestones).each (index, elem) ->
      milestone_days += parseInt($(elem).data('days'))
    milestone_days_id = milestone_id + '_days'
    return milestone_days

  $(".delete_sub_milestone_link").click ->
    milestone_id = $(this).parents('.milestone').attr('id')
    days = sumMilestoneDays(milestone_id)
    updateMilestoneDays(days, milestone_id)

  updateSubMilestone = (url, days) ->
    $.ajax
      url: url
      method: 'PATCH'
      dataType: 'script'
      data: { days: days },

  updateMilestoneDays = (days, milestone_id) ->
    milestone_id_sel = '#' + milestone_id
    
    $(milestone_id_sel).find('.days_text:first').html('Planned for ' + String(days) + ' days')



