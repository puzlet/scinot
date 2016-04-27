rep10 = (n) ->
  switch
    when n>1
      '10'+Array(n).join('&times;10')
    when n == 1
      '1&times;10'
    when n == 0
      '1'
    when n == -1
      '1/10'
    when n<-1
      '1/(10'+Array(-n).join('&times;10')+")"

n = slider_shift "n"

labels = (n) ->
  l = ""
  l+="#{k}" for k in [Math.sign(n)..n]
  switch
    when n >= 0
      Array(12+n).join('&nbsp;') + "#{n}"
    #when n == 0 
    #  '&nbsp;'
    when n < 0
      Array(12+n-1).join("&nbsp;") + "#{n}"

arrows = (n) ->
  switch 
    when n > 0
      Array(12).join('&nbsp;') +
        Array(n+1).join("&rarr;") + 
        "&#8226;"
    when n is 0
      Array(12).join('&nbsp;') + "&#8226;"
    when n < 0
      Array(12+n).join("&nbsp;") +
        "&#8226;" + 
        Array(-1*n+1).join("&larr;")
  
shift = (n) ->

  z = "000000000010000000000"
  g1 = "<span style='color:lightgrey'>"
  g2 = "</span>"
  s1 = "<span>"
  s2 = "</span>"
  
  switch 
    when n >= 0
      "#{g1+z[0...10]+g2}" + 
        "#{s1+z[10...11+n]+s2}" + 
        "#{g1+"&#8226;"+z[11+n..]+g2}"
    when n < 0
      "#{g1+z[0...10+n]+g2}" + 
        "#{s1+z[10+n]}&#8226;" +
        "#{z[11+n..10]+s2}" + 
        "#{g1+z[11..]+g2}"

table_number "<p>10<sup>#{n}</sup></p>" 

table_shift "<div> #{shift(n)} </div>" + 
    "<div> #{arrows(n)} </div>" +
    "<div> #{labels(n)} </div>"

table_rep rep10(n)
