(function() {
  var BarChartExample,
    _this = this;

  BarChartExample = (function() {
    BarChartExample.prototype.items = 10;

    BarChartExample.prototype.transitionSpeed = 1200;

    BarChartExample.prototype.pregrid = null;

    BarChartExample.prototype.bars = null;

    BarChartExample.prototype.grid = null;

    BarChartExample.prototype.h = 400;

    function BarChartExample() {
      this.container = d3.select("#svgcontainer").append("svg").attr("width", 700).attr("height", 500);
      this.pregrid = this.container.append('svg:g');
      this.bars = this.container.append('svg:g');
      this.grid = this.container.append('svg:g');
      this.createGrid();
      this.createBars();
    }

    BarChartExample.prototype.buildData = function() {
      var randomDataPoint;
      randomDataPoint = function(index) {
        return {
          key: index,
          val: Math.round(Math.random() * 100)
        };
      };
      return d3.range(this.items).map(randomDataPoint);
    };

    BarChartExample.prototype.createGrid = function() {
      var ticks, ydata;
      this.grid.append("line").attr("x1", 20).attr("x2", 20).attr("y1", 10).attr("y2", this.h).attr("class", "sidegrid");
      this.grid.append("line").attr("x1", 18).attr("x2", 600).attr("y1", this.h - 2).attr("y2", this.h - 2).attr("class", "sidegrid");
      ydata = d3.scale.linear().rangeRound([11, 400]);
      ticks = ydata.ticks(10);
      this.pregrid.selectAll().data(ticks).enter().append("line").attr("x1", 18).attr("x2", 600).attr("y1", ydata).attr("y2", ydata).attr("class", "innergrid");
      return this.pregrid.append("line").attr("x1", 600).attr("x2", 600).attr("y1", 11).attr("y2", this.h).attr("class", "innergrid");
    };

    BarChartExample.prototype.createBars = function() {
      var _this = this;
      this.x = d3.scale.linear().domain([0, this.items]).rangeRound([18, 598]);
      this.y = d3.scale.linear().domain([0, 100]).rangeRound([0, this.h]);
      return this.bars.selectAll().data(this.buildData()).enter().append("rect").attr("x", (function(d, i) {
        return _this.x(i) + 3;
      })).attr("y", (function(d) {
        return _this.h - _this.y(d.val);
      })).attr("width", (580 / this.items) - 3).attr("height", (function(d) {
        return _this.y(d.val);
      })).attr("rx", 5).attr("rect_data");
    };

    BarChartExample.prototype.redraw = function() {
      var _this = this;
      this.bars.selectAll("rect").data(this.buildData()).transition().duration(this.transitionSpeed).attr("y", (function(d) {
        return _this.h - _this.y(d.val);
      })).attr("height", (function(d) {
        return _this.y(d.val);
      }));
      return null;
    };

    return BarChartExample;

  })();

  this.barchart = new BarChartExample();

  setInterval((function() {
    return _this.barchart.redraw();
  }), 1500);

}).call(this);
