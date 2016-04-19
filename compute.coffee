
h = menu_examples()

egs = ["0",
  "900000000000000000000000000",
  "382700000000000000000000000",
  "5974000000000000000000000"]

d = new Decimal egs[h]

[M, E] = d.toString().split('e+') 

console.log "decimal", M, E 

###
count = (s, n) ->
  k = s.length-n
  f = s[0...k]
  b = s[k..]
  "<span style='font-size:18pt;background-color:white; color:black;'>#{f}</span>" +
  "<span style='font-size:18pt;background-color:black; color:white;'>#{b}</span>"
###

product = (s, n) ->
  console.log "s", s, n
  k = s.length-n
  f = s[0...k]
  b = s[k..]
  m = "1"+Array(n+1).join "0"
  ["<span style='font-size:18pt;'>#{f}&#8226;#{b}</span>",
  "<span style='font-size:18pt;'>&times;#{m}</span>"]

sn = (s, n) ->
  k = s.length-n
  f = s[0...k]
  b = s[k..]
  ["<span style='font-size:18pt;'>#{f}&#8226;#{b}</span>",
  "<span style='font-size:18pt;'>&times;10<sup>#{n}</sup></span>"]
            
#n = slider_count()
m = slider_shift()

#table_count "<span style='font-size:32pt;'>#{M}&times;10<sup>#{E}</sup></span>"
table_count "<span style='font-size:18pt'>#{egs[h]}</span>"

table_product product(egs[h], m)

#table_exp ["<span style='font-size:18pt;'>#{M}</span>",
#  "<span style='font-size:18pt;'>&times;10<sup>#{E}</sup></span>"]

console.log "sn?", sn(egs[h], m)
table_exp sn(egs[h], m)

table_sn "<span style='font-size:32pt;'>#{M}&times;10<sup>#{E}</sup></span>"

#table_sn sn(egs[h], m)
