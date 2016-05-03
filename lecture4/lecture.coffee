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
        
    small = @step "lecture-text-intro",
      action: entrance


new myLecture
