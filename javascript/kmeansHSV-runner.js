const ImageUtil = require("./image-util.js");

const RERUN_COUNT = 10;

class KMeansHSVRunner {

  run(k, pixels) {
    var clusters = null;
    var error = Infinity;
    console.log("HELLO");
    // re-run several times and keep the best result
    for(var attempt=0; attempt < RERUN_COUNT; attempt++) {
      let result = this.cluster(pixels, k);
      if(result.error < error) {
        clusters = result.clusters;
        error = result.error;
      }
    }

    return {
      clusters: clusters,
      error: error
    };
  }

  cluster(pixels, k) {
    // randomly initialize means
    var means = [];
    _.times(k, () => {
      let pixel = pixels[Math.floor(Math.random() * pixels.length)];
      means.push(pixel);
    });

    var done = false;
    var result = null;
    while(!done) {
      /* console.log("iterating...");*/
      result = this.groupPointsByMeans(means, pixels);
      let newMeans = this.computeMeans(result.groups);
      done = this.isDone(means, newMeans);
      means = newMeans;
    }
    /* console.log("DONE ===========================");*/
    return {
      clusters: result.groups,
      error: result.error,
      means: result.means
    }
  }

  computeMeans(groups) {
    return _.map(groups, (group) => {
      let averageColor = ImageUtil.computeAverageColor(group);
      let hsv = rgbToHsl(averageColor.red, averageColor.green, averageColor.blue);
      return {
        red: hsv[0],
        green: hsv[1],
        blue: hsv[2]
      };
    });
  }

  isDone(meansA, meansB) {
    var result = false;
    _.each(meansA, (mean) => {
      var meanIsAlsoInMeansB = false
      _.each(meansB, (otherMean) => {
        if((mean.red.toFixed(2) === otherMean.red.toFixed(2)) &&
           (mean.green.toFixed(2) === otherMean.green.toFixed(2)) &&
           (mean.blue.toFixed(2) === otherMean.blue.toFixed(2))) {
          meanIsAlsoInMeansB = true;
        }
      });
      result |= meanIsAlsoInMeansB;
    });
    return result;
  }

  groupPointsByMeans(means, points) {
    var totalError = 0;
    var groups = _.map(means, (m) => { return []; });

    _.each(points, (point) => {
      var bestGroupIndex;
      var bestGroupError = Infinity;
      _.each(means, (mean, index) => {
        var error = this.distance([point.red, point.green, point.blue], [mean.red, mean.green, mean.blue]);
        if (error < bestGroupError) {
          bestGroupError = error;
          bestGroupIndex = index;
        }
      });
      groups[bestGroupIndex].push(point);
      totalError += bestGroupError;
    });
    return {
      means: means,
      groups: groups,
      error: totalError
    };
  }

  distance(pointA, pointB) {
    let squaredDiffs = _.map(pointA, (dim, index) => {
      let diff = pointA[index] - pointB[index];
      return diff * diff;
    });
    return Math.sqrt(_.sum(squaredDiffs));
  }

  rgbToHsl(r, g, b) {
      r /= 255, g /= 255, b /= 255;

      var max = Math.max(r, g, b), min = Math.min(r, g, b);
      var h, s, l = (max + min) / 2;

      if (max == min) {
        h = s = 0; // achromatic
      } else {
        var d = max - min;
        s = l > 0.5 ? d / (2 - max - min) : d / (max + min);

        switch (max) {
          case r: h = (g - b) / d + (g < b ? 6 : 0); break;
          case g: h = (b - r) / d + 2; break;
          case b: h = (r - g) / d + 4; break;
        }

        h /= 6;
    }
    return [ h, s, l ];
  }

}

module.exports = KMeansHSVRunner;
