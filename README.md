# ColorChive
<div>
<img src="https://github.com/oeatekha/ColorChives/blob/main/Test%20Inputs/AMSTERDAM.png" width="800"/>
<img src="https://github.com/oeatekha/ColorChives/blob/main/Output/RGB%20PLOT%20AMST.jpg" width="800"/>
<div>

ColorChive is a MATLAB and web tool that allows you to explore different approaches to extract color palettes/gradients from images.  

Color quantization is a long studied issue in computer graphics. The idea of color quantization is utilizing decompression to represent an image in less pixels than its original format. Color quantization is also utilized to generate color palettes from images.

The goal of Colorchives is to develop a prototyping tool for designers to generate color palettes, specifically towards event based photos for archival purposes. The tool will allow users to upload images and generate a variety of palettes given different parameters and color spaces. This makes for a more intuitive artistic representation of various images that current color quantization algorithms are not optimized for.
Color spaces were made using RGB, Hue Saturation Value (HSV), and Hue Saturation Light (HSL). The project was made in MATLAB and can produce n number of KMean color clusters. 

Javascript implementation by Nina Lutz: https://github.com/ninalutz/Colorchives

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
HSV PLot of Image Below
</div>
<img src="https://github.com/oeatekha/ColorChives/blob/main/Test%20Inputs/AMSTERDAM.png" width="200"/>
</div>

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

## Example 3D Plot of Color Space

HSL Color Space and orignial image.
<div>
<img src="https://github.com/oeatekha/ColorChives/blob/main/Output/HSL.png" width="460">
<img src="https://github.com/oeatekha/ColorChives/blob/main/Test%20Inputs/Danger.png" width="460">
</div>



