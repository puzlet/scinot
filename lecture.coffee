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

    o =@step "lecture-text-50",
      action: "fade"
      replace: o

    o60 = @step "lecture-table-count",
      replace: o
      action: (o) ->
        f: -> o.fadeIn(1000)
        b: -> o.fadeOut()


new myLecture
