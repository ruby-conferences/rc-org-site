$ ->
  $('body').addClass('initialized')

  $home =
    $el: $("#home")
    toggleNav: (e) ->
      $li = $(e.target).closest('li')
      $li.addClass('active').siblings().removeClass('active')
      @$el.find('dl').removeClass('active').eq($li.index()).addClass('active')
      false
    init: ->
      @$el.find('nav li a').click($.proxy(@toggleNav, @)).first().click()

  $home.init()
