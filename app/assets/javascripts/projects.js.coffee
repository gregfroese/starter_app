# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(".sortme").sortable(
    connectWith: ".connected-sortable"
    cursor: "crosshair"
    opacity: 0.6
    scroll: true
    update: ->
      project_id = $("#project_id").val()
      iteration_id = $(this).attr('iteration')
      $.post "/projects/" + project_id + "/sortorder?iteration_id=" + iteration_id, $(this).sortable("serialize")
  ).disableSelection()


      

