class myLecture extends $blab.Lecture

  audioServer: "http://haulashore.com/audio"
  enableAudio: false

  opts = 
    renderTo: 'gauge'
    width: 200 #document.body.offsetWidth
    height: 200 #document.body.offsetHeight
    glow: true
    units: 'Km/h'
    title: false
    minValue: 0
    maxValue: 160
    majorTicks: ['0','20','40','60','80','100','120','140','160']#,'180','200','220']
    minorTicks: 2
    strokeTicks: false
    #highlights: [
    #  { from : 0,   to : 50, color : 'rgba(0,   255, 0, .15)' },
    #  { from : 50, to : 100, color : 'rgba(255, 255, 0, .15)' },
    #  { from : 100, to : 150, color : 'rgba(255, 30,  0, .25)' },
    #  { from : 150, to : 200, color : 'rgba(255, 0,  225, .25)' },
    #  { from : 200, to : 220, color : 'rgba(0, 0,  255, .25)' }
    #]
    colors:
      plate: '#222'
      majorTicks: '#f5f5f5'
      minorTicks: '#ddd'
      title: '#fff'
      units: '#ccc'
      numbers: '#eee'
    #needle:
    #  start: 'rgba(240, 128, 128, 1)'
    #  end: 'rgba(255, 160, 122, .9)'

  content: ->

    count = 0
    interval = null
    gauge = null
    
    speed = ->
      count += 1
      if count < 1000
        gauge.setValue( 135+(Math.random()-0.5)*0.45)
        gauge.draw()
      else
        clearInterval(interval)
      
    showGauge = (o, p) ->
      f: ->
        animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend'
        p.addClass("animated flipOutX").one animationEnd, ->
          p.hide()
          gauge = new Gauge(opts)
          interval = setInterval speed, 500
          #gauge.setValue(220)
          #gauge.draw()
          #o.show()
          o.show 0, ->
            o.addClass("animated flipInX")

        b: ->

          
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

    intro = @step "lecture-text-intro",
      action: entrance

    these = @step "lecture-text-these",
      action: (u) -> flash2(u, intro)

    instrument = @step "lecture-text-instrument",
      action: entrance

    text_gauge = @step "lecture-text-gauge",
      action: (u) -> showGauge(u, instrument)

    five = @step "lecture-text-five",
      action: (u) ->
        #clearInterval(interval)
        flash2(u, these)

    trust = @step "lecture-text-another",
      action: (u) ->
        clearInterval(interval)
        gauge.setValue(124.95)
        flash2(u, five)

    ###
    sf = @step "lecture-text-sf",
      action: (u) -> flash2(u, confidence)

    measure = @step "lecture-text-measure",
      action: entrance
        
    mantissa = @step "lecture-text-mantissa",
      action: (u) ->
        clearInterval(interval)
        flash2(u, sf)

    ###

new myLecture
