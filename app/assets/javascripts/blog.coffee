# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# 

//= require jquery
//= require bootstrap

//= require turbolinks
//= require jquery.hotkeys
//= require bootstrap-wysiwyg
//= require google-code-prettify/prettify
//= require app

$(document).on "turbolinks:load", ->
	show_textarea()	
	$('#editor').wysiwyg()
	window.prettyPrint && prettyPrint()



