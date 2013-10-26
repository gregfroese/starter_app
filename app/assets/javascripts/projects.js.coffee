# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#$.ajax
 #       url: '/books/sort'
  #      type: 'post'
   #     data: $('#books').sortable('serialize')
    #    dataType: 'script'
     #   complete: -> (request)
      #    $('#books').effect('highlight');

$ ->
  $('#sortme').sortable
    axis: 'y'
    cursor: 'crosshair'
    opacity: 0.6
    scroll: true
    update: ->
      project_id = $("#project_id").val()
      data = $("#sortme").sortable('serialize')
      $.post("/projects/" + project_id + "/sortorder", $(this).sortable('serialize'))
      
      
