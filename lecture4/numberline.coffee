
log10 = (u) -> Math.log10(u)
floor = (u) -> Math.floor(u)
abs = (u) -> Math.abs(u)
round = (u) -> Math.round(u)

sigArray = (u, sig) ->
  mult = 10**(sig - floor(log10 abs(u)) - 1)
  console.log "sigArray", round(u * mult)+[-2, -1, 0, 1, 2]
  (round(u * mult)+[-2, -1, 0, 1, 2])/mult

sigFigs = $blab.sigFigs


class d3Object

    constructor: (id) ->
        @element = d3.select "##{id}"
        @element.selectAll("svg").remove()
        @obj = @element.append "svg"
        #@initAxes()

    append: (obj) -> @obj.append obj
    
    #initAxes: ->

class Numberline extends d3Object

    #r = 5 # circle radius
    margin = {top: 0, right: 10, bottom: 0, left: 10}

    constructor: (X, W, H) ->

      #@left =  ($("##{X}").parent().width()-W)/2
      @width = W - margin.left - margin.right
      @height = H - margin.top - margin.bottom;
      super X
      #@initAxes(@u, @sig)

      @obj.attr("id", "numberline")
        .attr('width', W)
        .attr('height', H)
        #.attr('overflow', 'visible')

      @plot = @obj.append('g')
        .attr('transform', "translate(#{margin.left}, #{margin.top+@height/2})")
        .attr('width', @width)
        .attr('height', @height)
        .attr('id','numberline')

      @axis = @plot.append("g")
        .attr("id","x-axis")
        .attr("class", "axis")
        .attr("transform", "translate(#{margin.left*0}, #{@height/2*0})")
        #.call(@xAxis)    

      @circle1 = @plot.append("circle")
        .attr("transform", "translate(#{0}, #{@height/2*0})")
        .attr("r", 8)
        .attr("fill", "black")
        .attr("stroke", "black")

      @circle2 = @plot.append("circle")
        .attr("transform", "translate(#{0}, #{@height/2*0})")
        .attr("r", 5)
        .attr("fill", "red")

      ###
      @pline = d3.svg.line()
        .interpolate((points) -> points.join("A 0.2,1 0 0 1 "))
        .x((d) => @x(d.x))
        .y((d) => @height/2*0)

      @path = @plot.append("path")
        #.datum([{x:@u, y:0},{x:@ticks[2], y:0}])
        .attr("class", "line")
        #.attr("d", @pline)
      ###

    ###
    set: (u) ->
      
      @circle1.attr("cx", @x(u))
      @path.datum([{x:u, y:0},{x:@ticks[2], y:0}])
        .attr("d", @pline)
    ###

    initAxes: (u, sig) ->
      
        @ticks = sigArray(u, sig)
        console.log "ticks", @ticks

        @x = d3.scale.linear()
            .domain([@ticks[0], @ticks[4]])
            .range([0, @width])

        @xAxis = d3.svg.axis()
            .scale(@x)
            .orient("bottom")
            .tickFormat((v) => sigFigs(v, sig))
            .tickValues(@ticks)
        
        @axis.call(@xAxis)    

        @circle1.attr("cx", @x(u))

        U = Number(d3.format(".#{sig}g") u)
        @circle2.attr("cx", @x(U))
        
$blab.Numberline = Numberline
