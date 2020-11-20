# ColorChive

<img src="https://github.com/oeatekha/ColorChives/blob/main/AMSTERDAM.png" width="800"/>

Palette Maker is a MATLAB and web tool that allows you to explore different approaches to extract color palettes/gradients from images. 
Javascript Version by Nina Lutz: https://github.com/ninalutz/Colorchives

# Development
## Setup

* Clone the repository

* Install dependencies by running:
```
npm install
```
* For MATLAB run rgbToHsvPlot.m
```
webpack
```

This will generate a single a RGB, HSV, HSL 3D Plot and a kmeans collection of N colors.


## Future Work
Clean Up Source Code:
* Features
  * Additional algorithms - perhaps other clustering techniques and faster image sampling.
  * Improve the design of the extracted palettes, and make them more exportable.
  * Add sample images.
 

# Features 
Before running the program, simply add a local image to the file's path. The app will loads the image and create 3 plots in in three dimensional RGB space.

![](https://github.com/oeatekha/ColorChives/blob/main/HSV%20PLOT%20AMST.jpg)

## Color Spaces
Three color spaces are currently supported. HSL. HSV. and RGB,


### K-Means Clustering
[K-Means](https://en.wikipedia.org/wiki/K-means_clustering) attempts to cluster the pixels into k distinct clusters. The user provides a k value as input.


<div>
<img src="https://github.com/oeatekha/ColorChives/blob/main/HSL.png" width="460">
<img src="https://github.com/oeatekha/ColorChives/blob/main/danger.jpg.png" width="400">
</div>

