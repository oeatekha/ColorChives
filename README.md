# ColorChive

<img src="https://github.com/oeatekha/ColorChives/blob/main/Test%20Inputs/AMSTERDAM.png" width="800"/>

Palette Maker is a MATLAB and web tool that allows you to explore different approaches to extract color palettes/gradients from images. 
Javascript Version by Nina Lutz: https://github.com/ninalutz/Colorchives

# Development
## Setup

* Clone the repository

* Install
```
install all files
```
* For MATLAB run rgbToHsvPlot.m
```
Add image to path and run rgbToHsvPlot.m
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

![](https://github.com/oeatekha/ColorChives/blob/main/Output/HSV%20PLOT%20AMST.jpg)

## Color Spaces
Three color spaces are currently supported. HSL. HSV. and RGB,


### K-Means Clustering
[K-Means](https://en.wikipedia.org/wiki/K-means_clustering) attempts to cluster the pixels into k distinct clusters. The user provides a k value as input.
KMEANS HSL N = 4 Cluster for output Danger.png

<div>
<img src="https://github.com/oeatekha/ColorChives/blob/main/Output/HSL_KMEANS.png" width="460">
<img src="https://github.com/oeatekha/ColorChives/blob/main/Output/RGB_KMEANS.png" width="460">
</div>

Differences of the kmeans cluster for RGB vs HSL can be easily observed. 

## 3D Plot of Color Space

HSL Color Space and orignial image.
<div>
<img src="https://github.com/oeatekha/ColorChives/blob/main/Output/HSL.png" width="460">
<img src="https://github.com/oeatekha/ColorChives/blob/main/Test%20Inputs/Danger.png" width="460">
</div>



