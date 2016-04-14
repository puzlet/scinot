class myLecture extends $blab.Lecture

  audioServer: "http://haulashore.com/audio"
  enableAudio: false

  content: ->
    
    flash = (o) ->
      f: ->
        o.show 1000, ->
          o.addClass("flash-background")
          setTimeout (->
            o.removeClass("flash-background")
          ), 1000
      b: ->
        
    heading = (o) ->
      f: ->
        o.show 0, ->
          o.textillate({in:{effect:"swing"}})
      b: ->

    entrance = (o) ->
      f: ->
        o.show 0, ->
          o.addClass('animated flipInX')
      b: ->


    flash2 = (o, p) ->
      f: ->
        animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend'
        p.addClass("animated flipOutX").one animationEnd, ->
          o.show 0, ->
            o.addClass("animated flipInX")

      b: ->

        
    ###
    flash2 = (o, p) ->
      f: ->
        p.fadeOut 1000,-> 
          o.show 1000, ->
            o.addClass("flash-background")
            setTimeout (->
              o.removeClass("flash-background")
            ), 1000
      b: ->
      ###
        

    @step "lecture-heading",
      action: heading
        
    many = @step "lecture-text-many",
      action: entrance

    space = @step "lecture-text-space",
      action: entrance

    respect = @step "lecture-text-respect",
      action: (o) -> flash2(o, many)

    diameter = @step "lecture-text-diameter",
      action: (o) -> flash2(o, space)

    rarely = @step "lecture-text-rarely",
      action: (u) -> flash2(u, respect)

    instead = @step "lecture-text-instead",
      action: (u) -> flash2(u, rarely)

    sn = @step "lecture-text-sn",
      action: (u) -> flash2(u, diameter)

    roughly = @step "lecture-text-roughly",
      action: (u) -> flash2(u, instead)

    understanding = @step "lecture-text-understanding",
      action: (u) -> flash2(u, roughly)

    eg_intro = @step "lecture-text-eg-intro",
      action: (u) -> flash2(u, sn)
    #replace: diameter

    @step "lecture-menu-examples",
      #replace: eg_intro
      action: (u) -> flash2(u, eg_intro)

    @step "lecture-table-count",
      action: (o) ->
        f: -> o.fadeIn(1000)
        b: -> o.fadeOut()

    count_intro = @step "lecture-text-count",
      #replace: understanding
      action: (u) -> flash2(u, understanding)

    @step "lecture-slider-count",
      action: (u) -> flash2(u, count_intro)

    @step "lecture-slider-count",
      action: @action(vals: [1..3])

    counting = @step "lecture-text-counting-digits",
      action: (u) -> flash2(u, count_intro)

    for_instance = @step "lecture-text-for-instance",
      action: (u) -> flash2(u, counting)

    key = @step "lecture-text-key",
      action: (u) -> flash2(u, for_instance)

    o = @step "lecture-text-key-blank",
      action: "fade"
      replace: key

    product = @step "lecture-text-product",
      replace: o
      action: flash

    table_product = @step "lecture-table-product",
      replace: product 
      action: (o) ->
        f: -> o.fadeIn(1000)
        b: -> o.fadeOut()

    power_of_ten = @step "lecture-text-power-of-ten",
      action: "fade"

    @step "lecture-slider-shift",
      action: (u) -> flash2(u, power_of_ten)

    @step "lecture-slider-shift",
      action: @action(vals: [1..3])

    one_digit = @step "lecture-text-one-digit",
      action: flash

    all_that_remains= @step "lecture-text-all-that-remains",
      action: (u) -> flash2(u, one_digit)

    @step "lecture-table-sn",
      action: (u) -> flash2(u, all_that_remains)

new myLecture
