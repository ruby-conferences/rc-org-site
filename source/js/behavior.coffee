$ ->
  $event_list =
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
      phrase = $event_list.calloutText(dateData, phraseData)
      if phrase then $(@).text phrase else $(@).remove()

    init: ->
      $("[data-phrase]").each(@addCallout)

  $event_list.init()
