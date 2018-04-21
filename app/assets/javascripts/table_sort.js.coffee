$(document).on 'turbolinks:load', ->
  $('.table-sortable').sortable
    items: '.nested-fields'
    update: ->
      $(this).find('input[type=hidden][name*=position]').each (index) ->
        $(this).val(index + 1)
