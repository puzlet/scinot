Decimal.config({ toExpNeg: -70 })

ss = slider_exp()
dd = new Decimal ss
bb = new Decimal 7


# decimal table (0.007)
xx = bb.mul(Decimal.pow(10,dd))
table_decimal "<span style='font-size:18pt'>#{xx}</span>"


# repetition table (7/10/10/10)

rep10 = (b, n) ->
  switch
    when n>1
      "#{b}&times;10"+Array(n).join('&times;10')
    when n == 1
      "#{b}&times;10"
    when n == 0
      "#{b}"
    when n == -1
      "#{b}&divide;10"
    when n<-1
      "#{b}&divide;10"+Array(-n).join('&divide;10')

table_rep ["7&times;", rep10(1, ss)]


# scientific notation table (7e-3)
table_sn "<span style='font-size:32pt;'>#{bb}&times;10<sup>#{ss}</sup></span>"


# product table (7*0.001)
kk = Decimal.pow(10,dd)
table_product [bb.toString()+"&times;", kk.toString()]


# decimal point shift table

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

  z = "000000000070000000000"
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
        g1+z[11..]+g2

table_shift "<div> #{shift(ss)} </div>" + 
    "<div> #{arrows(ss)} </div>" +
    "<div> #{labels(ss)} </div>"
