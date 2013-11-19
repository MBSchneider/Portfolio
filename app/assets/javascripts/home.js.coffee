# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$(document).ready ->
  navpath = window.location.pathname.split("/")[1]
  $(".activation").removeClass "active"
  switch navpath
    when "contact"
      console.log "IN SWITCH CONTACT"
      $("#contactlink").addClass "active"
    when "projects"
      $("#projectlink").addClass "active"
    when "posts"
      $("#bloglink").addClass "active"
    else
      $("#homelink").addClass "active"
