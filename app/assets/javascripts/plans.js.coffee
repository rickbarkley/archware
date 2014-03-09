# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#new_image').fileupload()

jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

jQuery ->	
	add_fields = (link, association, content) ->
	  new_id = new Date().getTime()
	  regexp = new RegExp("new_" + association, "g")
	  $(link).parent().before content.replace(regexp, new_id)


