
h = menu_examples()

egs = ["0",
  "260000000000000000000000000",
  "382700000000000000000000000",
  "5974000000000000000000000"]
      
count = (s, n) ->
  k = s.length-n
  f = s[0...k]
  b = s[k..]
  "<span style='background-color:white; color:black;'>#{f}</span>" +
  "<span style='background-color:black; color:white;'>#{b}</span>"

product = (s, n) ->
  console.log "s", s, n
  k = s.length-n
  f = s[0...k]
  b = s[k..]
  m = "1"+Array(n+1).join "0"
  ["<span>#{f}&#8226;#{b}</span>",
  "<span>&times;#{m}</span>"]

sn = (s, n) ->
  k = s.length-n
  f = s[0...k]
  b = s[k..]
  ["<span>#{f}</span><span>&#8226;</span><span>#{b}</span>",
  "<span>&times;10<sup>#{n}</sup></span>"]
            
n = slider_count()
m = slider_shift()

table_count count(egs[h], n)

table_product product(egs[h], m)

table_sn ["<span>9</span>",
  "<span>&times;10<sup>26</sup></span>"]
