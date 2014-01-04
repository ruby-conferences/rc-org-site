$ ->
  $('nav li').click (e)->
    e.preventDefault()
    $this = $(this)

    unless $this.hasClass 'active'
      $('nav li, dl.events').removeClass 'active'
      $("dl.#{$this.attr('id')}").add($this).addClass 'active'
