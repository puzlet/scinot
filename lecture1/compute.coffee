h = menu_examples()
m = slider_shift()

example = ["0",
  "900000000000000000000000000",
  "382700000000000000000000000",
  "5974000000000000000000000"]

table_decimal "<span style='font-size:18pt'>#{example[h]}</span>"

decimal = new Decimal example[h]
[M, E] = decimal.toString().split('e+') 
table_sn "<span style='font-size:32pt;'>#{M}&times;10<sup>#{E}</sup></span>"

disp = (s, n) ->
  k = s.length-n
  f = s[0...k]
  b = s[k..]
  z = "1" + Array(n+1).join "0"
  out = 
    mantissa: "<span style='font-size:18pt;'>#{f}&#8226;#{b}</span>"
    expo: "<span style='font-size:18pt;'>&times;10<sup>#{n}</sup></span>"
    mult: "<span style='font-size:18pt;'>&times;#{z}</span>"

num = disp(example[h], m)
table_product [num.mantissa, num.mult]
table_exp [num.mantissa, num.expo]

