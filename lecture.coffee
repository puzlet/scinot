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

    bigNumber = (o) ->
      f: ->
        o.show 0, ->
          o.textillate({in:{effect:"fadInRightBig"}})
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
          p.hide()
          o.show 0, ->
            o.addClass("animated flipInX")

      b: ->

    flash3 = (o, p) ->
      f: ->
        animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend'
        p.addClass("animated flipOutX").one animationEnd, ->
          p.hide()
          o.show 0, ->
            o.textillate({in:{effect:"fadeInRightBig"}})

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
      action: "fade"
        
    many = @step "lecture-text-many",
      action: entrance

    space = @step "lecture-text-space",
      action: entrance

    respect = @step "lecture-text-respect",
      action: (o) -> flash2(o, many)

    #diameter = @step "lecture-text-diameter",
    #  action: (o) -> flash2(o, space)

    diameter = @step "lecture-table-count",
      action: (o) -> flash2(o, space)

    rarely = @step "lecture-text-rarely",
      action: (u) -> flash2(u, respect)

    instead = @step "lecture-text-instead",
      action: (u) -> flash2(u, rarely)

    sn = @step "lecture-table-sn",
      action: (u) -> flash2(u, instead)

    roughly = @step "lecture-text-roughly",
      action: entrance

    understanding = @step "lecture-text-understanding",
      action: (u) -> flash2(u, roughly)

    table_product = @step "lecture-table-product",
      action: entrance

    eg_intro = @step "lecture-text-eg-intro",
      action: (u) -> flash2(u, understanding)

    @step "lecture-slider-shift",
      action: (u) -> flash2(u, eg_intro)

    @step "lecture-slider-shift",
      action: @action(vals: [1..3])

    expo = @step "lecture-text-exp",
      action: entrance

    @step "lecture-table-exp",
      action: entrance

    shift = @step "lecture-text-shift",
      action: (u) -> flash2(u, expo)

    @step "lecture-slider-shift",
      action: @action(vals: [4..26])

    question = @step "lecture-text-question",
      action: (u) -> flash2(u, shift)

    choose = @step "lecture-text-choose",
      action: (u) -> flash2(u, question)

    @step "lecture-menu-examples",
      action: (u) -> flash2(u, choose)

    ###

    @step "lecture-table-count",
      action: entrance


      
    count_intro = @step "lecture-text-count",
      action: entrance


    counting = @step "lecture-text-counting-digits",
      action: entrance

    for_instance = @step "lecture-text-for-instance",
      action: (u) -> flash2(u, counting)

    key = @step "lecture-text-key",
      action: (u) -> flash2(u, for_instance)

    #o = @step "lecture-text-key-blank",
    #  action: "fade"
    #  replace: key

    product = @step "lecture-text-product",
      action: (u) -> flash2(u, key)

        
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

    ###

new myLecture
