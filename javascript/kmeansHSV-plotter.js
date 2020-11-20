  const ImageUtil = require("./image-util.js");

class KMeansHSVPlotter {
  plot(elementId, clusters) {
    var data = _.map(clusters, function(group){
      var avgColor = ImageUtil.computeAverageColor(group);
      var colorString = "rgb(" + parseInt(avgColor.red) + "," + parseInt(avgColor.green) + "," + parseInt(avgColor.blue) + ")";
      return {
        x: _.map(group, function(p){ return p.red; }),
        y: _.map(group, function(p){ return p.green; }),
        z: _.map(group, function(p){ return p.blue; }),
        mode: 'markers',
        marker: {
          color: colorString,
          size: 3,
          line: {
            color: 'rgb(100,100,100)',
            width: 1
          }
        },
        type: 'scatter3d'
      };
    });

    var layout = {
      margin: { l:0, r:0, b: 0, t: 0 },
      scene: {
        xaxis: { title: "RedHUE" },
        yaxis: { title: "GreenS"},
        zaxis: { title: "BlueV"}
      }
    };

    Plotly.newPlot(elementId, data, layout);
  }
}

module.exports = KMeansHSVPlotter;
