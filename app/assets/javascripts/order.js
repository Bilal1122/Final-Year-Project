$ ->
  if window.pageIs('.orders.show')

  	// # $('#delayed').on 'click', (evt) ->
   // #    document.getElementById('order_status').value = "delayed"
   // #    evt.preventDefault()
    window.hide = ->
      $("#completed").css('display', 'none')
      return

