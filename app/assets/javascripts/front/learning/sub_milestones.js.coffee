# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'page:change', ->
  $(".select_sub_milestone_days").change ->
    $(this).data('days', $(this).val())
    days = $(this).data('days')
    

    $.ajax
      url: $(this).data('url')
      method: 'PATCH'
      dataType: 'script'
      data: { days: days },

    milestone_days_id = 'milestone_' + $(this).data('parent-id') + '_days'
    current_milestone = $('#' + milestone_days_id)
    sub_milestones = current_milestone.find($('.select_sub_milestone_days'))
    milestone_days = 0
    sub_milestones.forEach(alert($(this).data('days')))
    
    
