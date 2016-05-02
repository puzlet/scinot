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
        
    small = @step "lecture-text-small",
      action: entrance

    seven = @step "lecture-text-seven",
      action: (u) -> flash2(u, small)

    eg = @step "lecture-text-eg",
      action: (u) -> flash2(u, seven)

    decimal = @step "lecture-table-decimal",
      action: entrance

    text_product = @step "lecture-text-product",
      action: entrance

    table_product = @step "lecture-table-product",
      action: (u) -> flash2(u, text_product)

    text_repeated = @step "lecture-text-repeated",
      action: entrance

    table_repeated = @step "lecture-table-repeated",
      action: (u) -> flash2(u, text_repeated)

    text_shift = @step "lecture-text-shift",
      action: entrance

    table_shift = @step "lecture-table-shift",
      action: (u) -> flash2(u, text_shift)

    text_sn1 = @step "lecture-text-sn1",
      action: entrance

    text_sn2 = @step "lecture-text-sn2",
      action: (u) -> flash2(u, text_sn1)

    text_sn3 = @step "lecture-text-sn3",
      action: (u) -> flash2(u, text_sn2)

    text_sn4 = @step "lecture-text-sn4",
      action: (u) -> flash2(u, text_sn3)

    table_sn = @step "lecture-table-sn",
      action: (u) -> flash2(u, text_sn4)

    text_exp = @step "lecture-text-exp",
      action: (u) -> flash2(u, eg)

    slider_exp = @step "lecture-slider-exp",
      action: (u) -> flash2(u, text_exp)

new myLecture
