class myLecture extends $blab.Lecture

  audioServer: "http://haulashore.com/audio"
  enableAudio: false

  content: ->
    
    entrance = (o) ->
      f: ->
        o.show 0, ->
          o.addClass('animated flipInX')
      b: ->
        o.hide()
        
    flash2 = (o, p) ->
      f: ->
        animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend'
        p.addClass("animated flipOutX").one animationEnd, ->
          p.hide()
          o.show 0, ->
            o.addClass("animated flipInX")
      b: ->
        o.hide()
       
    @step "lecture-heading",
      action: "fade"
        
    powers = @step "lecture-text-powers",
      action: entrance

    number = @step "lecture-table-number",
      action: entrance

    top = @step "lecture-text-top",
      action: (u) -> flash2(u, powers)

    shift = @step "lecture-slider-shift",
      action: (u) -> flash2(u, top)

    @step "lecture-slider-shift",
      action: @action(vals: [1..3])

    positive = @step "lecture-text-positive",
      action: entrance

    @step "lecture-table-rep",
      action: (u) -> flash2(u, positive)

    negative = @step "lecture-text-negative",
      action: entrance
      
    @step "lecture-slider-shift",
      action: @action(vals: [3..-3])


new myLecture
