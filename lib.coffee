
$blab.sigFigs = (u, n) ->
  x = new Decimal(u)
  N = x.truncated().toString().length # length of integer part
  if n >= N
    x.toPrecision(n) # returns exp notation when n < N
  else
    x.toSignificantDigits(n).toString()    

