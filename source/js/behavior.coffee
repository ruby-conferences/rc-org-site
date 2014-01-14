$ ->
  $('body').addClass('initialized')

  $home =
    $el: $("#home")
    setDateLanguage: ->
      date = moment($(@).data('date'))
      if date.isValid()
        $(@).text("#{$(@).data('noun')} #{$(@).data('verb')} #{date.fromNow()}")
      else
        $(@).text("#{$(@).data('noun')} #{$(@).data('date')}")
    toggleNav: (e) ->
      $li = $(e.target).closest('li')
      $li.addClass('active').siblings().removeClass('active')
      @$el.find('dl').removeClass('active').eq($li.index()).addClass('active')
      false
    init: ->
      @$el.find('nav li a').click($.proxy(@toggleNav, @)).first().click()
      $("[data-date]").each(@setDateLanguage)
      $("[data-opens]")

  $home.init()
