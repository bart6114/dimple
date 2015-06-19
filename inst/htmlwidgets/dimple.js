HTMLWidgets.widget({

  name: 'dimple',

  type: 'output',

  renderValue: function(el, config, instance) {

    var svg = dimple.newSvg(el, config.width, config.height);
    var data = HTMLWidgets.dataframeToD3(config.data);


    var myChart = new dimple.chart(svg, data);
    myChart.setBounds(config.boundsX ? config.boundsX : 60,
                      config.boundsY ? config.boundsY : 45,
                      config.boundsWidth ? config.boundsWidth : config.width-80,
                      config.boundsHeight ? config.boundsHeight : config.height-85);

    if("xCategory" in config){
      var x = myChart.addCategoryAxis("x", config.xCategory);
      x.addOrderRule(config.xOrderRule);
      x.addGroupOrderRule(config.xGroupOrderRule);
    }

    if("xMeasure" in config){
      myChart.addMeasureAxis("x", config.xMeasure);
    }

    if("xPct" in config){
      myChart.addPctAxis("x", config.xPct);
    }

    if("yCategory" in config){
      var y = myChart.addCategoryAxis("y", config.yCategory);
      y.addOrderRule(config.yOrderRule);
      y.addGroupOrderRule(config.yGroupOrderRule);
    }

    if("yMeasure" in config){
      myChart.addMeasureAxis("y", config.yMeasure);
    }

    if("yPct" in config){
      myChart.addPctAxis("y", config.yPct);
    }

    if("pMeasure" in config){
      myChart.addMeasureAxis("p", config.pMeasure);
    }

    if("zMeasure" in config){
      var z = myChart.addMeasureAxis("z", config.zMeasure);
      if("zOverrideMax" in config) z.overrideMax = config.zOverrideMax;
    }

    var chartTypes = {
      bar: dimple.plot.bar,
      pie: dimple.plot.pie,
      bubble: dimple.plot.bubble,
      area: dimple.plot.area,
      line: dimple.plot.line,
      step: dimple.plot.line,
      steparea: dimple.plot.area
    };

    var chartFunc = chartTypes[config.chartType];

    var s = myChart.addSeries(config.series, chartFunc);
    s.stacked = config.stacked;

    if("seriesAggregate" in config) s.aggregate = dimple.aggregateMethod.max;
    if("seriesLineWeight" in config) s.lineWeight = config.seriesLineWeight;
    if("seriesBarGap" in config) s.barGap = config.seriesBarGap;
    if("piesRadius" in config) s.radius = config.piesRadius;
    if("ringInnerRadius" in config) s.innerRadius = config.ringInnerRadius;
    if("ringOuterRadius" in config) s.outerRadius = config.ringOuterRadius;

    if(config.chartType === "step") s.interpolation = "step";
    if(config.chartType === "steparea") s.interpolation = "step";


    if(config.legend === true){
      myChart.addLegend(config.legendX ? config.legendX : 0,
                        config.legendY ? config.legendY : 5,
                        config.legendWidth ? config.legendWidth : config.width,
                        config.legendHeight ? config.legendHeight : config.height,
                        config.legendHorizontalAlign ? config.legendHorizontalAlign : "right");
    }




    myChart.draw();



  },

  resize: function(el, width, height, instance) {

  }

});
