class myLecture extends $blab.Lecture

  audioServer: "http://haulashore.com/audio"
  enableAudio: false

  content: ->
    
    @step "lecture-heading"

    o = @step "lecture-text-10",
      action: "fade"

    o = @step "lecture-text-20",
      action: "fade"
      replace: o

    o = @step "lecture-text-30",
      action: "fade"
      replace: o

    o = @step "lecture-text-40",
      action: "fade"
      replace: o

    o = @step "lecture-text-50",
      action: "fade"
      replace: o

    @step "lecture-table-count",
      replace: o
      action: (o) ->
        f: -> o.fadeIn(1000)
        b: -> o.fadeOut()

    o = @step "lecture-text-60",
      action: "fade"

    @step "lecture-slider-count",
      replace: o
      action: "fade"

    @step "lecture-slider-count",
      action: @action(vals: [1..27])

    o = @step "lecture-text-70",
      action: "fade"

    o = @step "lecture-text-80",
      action: "fade"
      replace: o

    o = @step "lecture-text-90",
      action: "fade"
      replace: o

new myLecture
