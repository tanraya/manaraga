$ ->
  manaragaTables = $('table.manaraga')
  manaragaTables.on 'click.manaraga', 'tr', (e) ->
    if e.target.nodeName isnt 'A'
      location.href = $(this).data('url')

  manaragaTables.on 'mouseenter.manaraga', 'a.btn', ->
    button = $(this)
    row    = button.closest('tr')

    row.addClass('danger')  if button.hasClass('btn-danger')
    row.addClass('success') if button.hasClass('btn-success')
    row.addClass('info')    if button.hasClass('btn-info')

  manaragaTables.on 'mouseleave.manaraga', 'a.btn', ->
    $(this).closest('tr')
           .removeClass('danger')
           .removeClass('success')
           .removeClass('info')
