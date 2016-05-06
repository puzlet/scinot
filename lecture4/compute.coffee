

#sf = slider_sigfigs()

xx = table_input [] #6.2345

@nl1 = new $blab.Numberline "lecture-text-nl1", 400, 200
@nl1.initAxes(xx, 1)

@nl2 = new $blab.Numberline "lecture-text-nl2", 400, 200
@nl2.initAxes(xx, 2)

@nl3 = new $blab.Numberline "lecture-text-nl3", 400, 200
@nl3.initAxes(xx, 3)
