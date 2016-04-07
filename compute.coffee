
###
count = (s, n) ->
  k = s.length-n
  f = s[0...k]
  b = s[k..]
  "<span style='color:black;'>#{f}</span>" +
  "<span style='color:red;'>#{b}</span>"
###

k = slider()

console.log "k", k
