class BarChartExample
    items: 10
    transitionSpeed: 1200
    pregrid: null
    bars: null
    grid: null
    h: 400
    constructor: ->
        @container = d3.select("#svgcontainer").append("svg").attr("width", 700).attr("height", 500)
        @pregrid = @container.append('svg:g')
        @bars = @container.append('svg:g')
        @grid = @container.append('svg:g')

        @createGrid()
        @createBars()

    buildData: ->
        randomDataPoint = (index) -> {key: index, val: Math.round(Math.random() * 100)}
        d3.range(@items).map(randomDataPoint)

    createGrid: ->
        # Fixed Grids
        @grid.append("line")
            .attr("x1", 20)
            .attr("x2", 20)
            .attr("y1", 10)
            .attr("y2", @h)
            .attr("class", "sidegrid")

        @grid.append("line")
            .attr("x1", 18)
            .attr("x2", 600)
            .attr("y1", @h - 2)
            .attr("y2", @h - 2)
            .attr("class", "sidegrid")

        ydata = d3.scale.linear().rangeRound([11, 400])
        ticks = ydata.ticks(10)

        @pregrid.selectAll()
            .data(ticks)
            .enter()
            .append("line")
            .attr("x1", 18)
            .attr("x2", 600)
            .attr("y1", ydata)
            .attr("y2", ydata)
            .attr("class", "innergrid")

        @pregrid.append("line")
            .attr("x1", 600)
            .attr("x2", 600)
            .attr("y1", 11)
            .attr("y2", @h)
            .attr("class", "innergrid")

    createBars: ->
        @x = d3.scale.linear().domain([0, @items]).rangeRound([18, 598])
        @y = d3.scale.linear().domain([0, 100]).rangeRound([0, @h])

        @bars.selectAll()
            .data(@buildData())
            .enter()
            .append("rect")
            .attr("x", ((d, i) => @x(i) + 3))
            .attr("y", ((d) => @h - @y(d.val)))
            .attr("width", (580 / @items) - 3)
            .attr("height",((d) => @y(d.val)))
            .attr("rx", 5)
            .attr("rect_data")

    redraw: ->
        @bars.selectAll("rect")
            .data(@buildData())
            .transition()
            .duration(@transitionSpeed)
            .attr("y", ((d) => @h - @y(d.val)))
            .attr("height",((d) => @y(d.val)))

        return null

@barchart = new BarChartExample()
setInterval((=> @barchart.redraw()), 1500)

