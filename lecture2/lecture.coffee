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

    multiply = @step "lecture-text-multiply",
      action: (u) -> flash2(u, positive)

    @step "lecture-table-rep",
      action: (u) -> flash2(u, multiply)

    negative = @step "lecture-text-negative",
      action: entrance

    divide = @step "lecture-text-divide",
      action: (u) -> flash2(u, negative)
      
    @step "lecture-slider-shift",
      action: @action(vals: [3..-3])

    shift = @step "lecture-text-shift",
      action: (u) -> flash2(u, divide)

    left = @step "lecture-text-left",
      action: (u) -> flash2(u, shift)

    @step "lecture-table-shift",
      action: (u) -> flash2(u, left)

    enough1 = @step "lecture-text-enough1",
      action: entrance

    enough2 = @step "lecture-text-enough2",
      action: (u) -> flash2(u, enough1)

    enough3 = @step "lecture-text-enough3",
      action: (u) -> flash2(u, enough2)

    enough4 = @step "lecture-text-enough4",
      action: (u) -> flash2(u, enough3)
    

new myLecture
