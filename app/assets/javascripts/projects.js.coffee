# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.sortme').sortable
    axis: 'y'
    cursor: 'crosshair'
    opacity: 0.6
    scroll: true
    update: ->
      project_id = $("#project_id").val()
      $.post("/projects/" + project_id + "/sortorder", $(this).sortable('serialize'))

  $("#iteration-switch input").click (event) ->
    project_id = $("#project_id").val()
    $.ajax "/projects/" + project_id + "/" + $(event.target).data("view"),
      complete: ->
        console.log "complete"
    


      

