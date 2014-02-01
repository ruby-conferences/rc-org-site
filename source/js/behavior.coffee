$ ->

  $home =
    $el: $("#home")
    setDateLanguage: ->
      phrase = $(@).data('phrase')
      if $(@).data('date')
        date = moment($(@).data('date')).add('days', 1)
        $(@).text "#{phrase} #{date.fromNow()}"
      else
        $(@).text phrase
    toggleNav: (e) ->
      $li = $(e.target).closest('li')
      $li.addClass('active').siblings().removeClass('active')
      @$el.find('dl').removeClass('active').eq($li.index()).addClass('active')
      false
    init: ->
      @$el.find('nav li a').click($.proxy(@toggleNav, @)).first().click()
      $("[data-phrase]").each(@setDateLanguage)

  $home.init()
