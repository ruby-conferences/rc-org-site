$ ->

  $home =
    $el: $("#home")
    calloutText: (dateData, phraseData)->
      date = if dateData then moment(dateData) else false
      return phraseData unless date

      now = moment()
      switch
        when date.isSame(now, 'day')
          "#{phraseData} today"
        when date.isSame(now.add(1, 'day'), 'day')
          "#{phraseData} tomorrow"
        when date.isAfter(now)
          "#{phraseData} #{date.endOf('day').fromNow()}"

    addCallout: ->
      dateData   = $(@).data().date
      phraseData = $(@).data().phrase

      $(@).text $home.calloutText(dateData, phraseData)
    toggleNav: (e) ->
      $li = $(e.target).closest('li')
      $li.addClass('active').siblings().removeClass('active')
      @$el.find('dl').removeClass('active').eq($li.index()).addClass('active')
      false
    init: ->
      @$el.find('nav li a').click($.proxy(@toggleNav, @)).first().click()
      $("[data-phrase]").each(@addCallout)

  $home.init()
