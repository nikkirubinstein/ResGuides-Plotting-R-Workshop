


# Customising ggplot figures
 
<!--sec data-title="Learning Objectives" data-id="obj" data-show=true data-collapse=false ces-->

* to fill in later

<!--endsec-->

<br>

---

**Table of Contents**

<!-- toc -->

<br>

---

## Customising your ggplot

So far you have learnt the basic structure of a plot, and how to map from the dataset to the aesthetic features of the plot. In this section you will learn how to change the aesthetic attributes of the plot that do not map onto the dataset.

<br>

---

## Changing the features of the geometric layers

At times you may want to change the aesthetic of all the elements in a geom_layer in the same way. For example, you may want all of your symbols to be coloured red. This is achieved by adding `col = 'red'` to the geom_point layer (not inside an `aes` function).


~~~sourcecode
ggplot(msleep, 
       aes(x = bodywt, y = brainwt)) +
  geom_point(colour = "red")
~~~



~~~err
Warning: Removed 27 rows containing missing values (geom_point).

~~~

<img src="images/custom-unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" style="display: block; margin: auto;" />

Other things that you could change include:
* symbol border widths 
* symbol border colours
* symbol size
* symbol shape
* line width
* symbol / line transparency

Here we have a particularly ugly example of these aesthetic changes. **Note** that these changes are **NOT** placed in the `aes` function.


~~~sourcecode
ggplot(data = msleep, 
       aes(x = bodywt, y = brainwt)) +
  geom_point(colour = "red", fill="green", size=3, shape=21, stroke=4) + geom_line(colour="blue", size = 2, linetype = 2, alpha = 0.2)
~~~



~~~err
Warning: Removed 27 rows containing missing values (geom_point).

~~~

<img src="images/custom-unnamed-chunk-3-1.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" style="display: block; margin: auto;" />

In the above example, we have added a `geom_line()` layer to the plot. Layers are drawn in the order that they are written, so the line `geom_line()` layer appears on top of the `geom_point()` layer. 

The `shape` of the symbols in the `geom_point()` layer have been changed from the default value of 1 (solid circles) to 21 (open circles). The `fill` colour of the circles has been set to `green` and the border colour (`colour`) to `red`. The `size` of the points has been increased from 1 to 3 and the width of the border (`stroke`) to 4.

The lines in the `geom_line()` layer are of `linetype` 2, which corresponds to dashed lines. These lines are coloured (`colour`) `blue`, with a transparency level of 0.2 (possible `alpha` values range from 0 to 1) and twice the thickness (`size`) of the default lines.

<!--sec data-title="Challenge 1" data-id="ch1" data-show=true data-collapse=false ces-->


~~~sourcecode
ggplot(data = na.omit(msleep), 
       aes(x = bodywt, y = brainwt, colour = sleep_total)) +
  geom_point()
~~~

Modify the above code to display triangular symbols in the scatterplot, instead of circles.

**HINT:** Use the shape argument in the `geom_point` layer, which takes an integer value. Circles are created using shape = 1. 

<!--endsec-->

<br>

---

## Colour schemes

The default colour scheme is not always the best option for your plot. In R, colours can be defined by: name, RGB value or hexadecimal. You can choose to change your colour scheme manually or through an already created colour palette.

To manually alter your colour scheme, you can use the functions:
* `scale_colour_manual` - change the colour defined by categorical variables
* `scale_fill_manual` - change the fill colour defined by categorical variables
* `scale_colour_gradient` - change the colour defined by numeric variables
* `scale_fill_gradient` - change the fill colour defined by numeric variables



How to change the colour scheme
scale_colour_manual and scale_fill_manual and scale_colour_gradientn to change colours manually
scale_colour_discrete, scale_colour_continuous
For colour blind it is important to vary colours in hue, saturation and luminance
Colours can be defined by name, rgb or hexadecimal
colour picker - no help for colour blindness

http://www.husl-colors.org/

http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/
http://colorbrewer2.org/
<br>

---

## Altering the legend

legend location, title and names
theme
legend.background	background of legend (element_rect; inherits from rect)
legend.margin	extra space added around legend (unit)
legend.key	background underneath legend keys (element_rect; inherits from rect)
legend.key.size	size of legend keys (unit; inherits from legend.key.size)
legend.key.height	key background height (unit; inherits from legend.key.size)
legend.key.width	key background width (unit; inherits from legend.key.size)
legend.text	legend item labels (element_text; inherits from text)
legend.text.align	alignment of legend labels (number from 0 (left) to 1 (right))
legend.title	title of legend (element_text; inherits from title)
legend.title.align	alignment of legend title (number from 0 (left) to 1 (right))
legend.position	the position of legends ("none", "left", "right", "bottom", "top", or two-element numeric vector)
legend.direction	layout of items in legends ("horizontal" or "vertical")
legend.justification	anchor point for positioning legend inside plot ("center" or two-element numeric vector)
legend.box	arrangement of multiple legends ("horizontal" or "vertical")
legend.box.just	justification of each legend within the overall bounding box, when there are multiple legends ("top", "bottom", "left", or "right")

<br>

---

## Plot annotations

annotate

<br>

---

## Modifying the plot axes and tick marks

theme
axis.title	label of axes (element_text; inherits from text)
axis.title.x	x axis label (element_text; inherits from axis.title)
axis.title.y	y axis label (element_text; inherits from axis.title)
axis.text	tick labels along axes (element_text; inherits from text)
axis.text.x	x axis tick labels (element_text; inherits from axis.text)
axis.text.y	y axis tick labels (element_text; inherits from axis.text)
axis.ticks	tick marks along axes (element_line; inherits from line)
axis.ticks.x	x axis tick marks (element_line; inherits from axis.ticks)
axis.ticks.y	y axis tick marks (element_line; inherits from axis.ticks)
axis.ticks.length	length of tick marks (unit)
axis.line	lines along axes (element_line; inherits from line)
axis.line.x	line along x axis (element_line; inherits from axis.line)
axis.line.y	line along y axis (element_line; inherits from axis.line)

<br>

---

## Changing the plot background and grid lines

theme 

line	all line elements (element_line)
rect	all rectangular elements (element_rect)
text	all text elements (element_text)
title	all title elements: plot, axes, legends (element_text; inherits from text)
aspect.ratio	aspect ratio of the panel
panel.background	background of plotting area, drawn underneath plot (element_rect; inherits from rect)
panel.border	border around plotting area, drawn on top of plot so that it covers tick marks and grid lines. This should be used with fill=NA (element_rect; inherits from rect)
panel.margin	margin around facet panels (unit)
panel.margin.x	horizontal margin around facet panels (unit; inherits from panel.margin)
panel.margin.y	vertical margin around facet panels (unit; inherits from panel.margin)
panel.grid	grid lines (element_line; inherits from line)
panel.grid.major	major grid lines (element_line; inherits from panel.grid)
panel.grid.minor	minor grid lines (element_line; inherits from panel.grid)
panel.grid.major.x	vertical major grid lines (element_line; inherits from panel.grid.major)
panel.grid.major.y	horizontal major grid lines (element_line; inherits from panel.grid.major)
panel.grid.minor.x	vertical minor grid lines (element_line; inherits from panel.grid.minor)
panel.grid.minor.y	horizontal minor grid lines (element_line; inherits from panel.grid.minor)
panel.ontop	option to place the panel (background, gridlines) over the data layers. Usually used with a transparent or blank panel.background. (logical)
plot.background	background of the entire plot (element_rect; inherits from rect)
plot.title	plot title (text appearance) (element_text; inherits from title)
plot.margin	margin around entire plot (unit with the sizes of the top, right, bottom, and left margins)
strip.background	background of facet labels (element_rect; inherits from rect)
strip.text	facet labels (element_text; inherits from text)
strip.text.x	facet labels along horizontal direction (element_text; inherits from strip.text)
strip.text.y	facet labels along vertical direction (element_text; inherits from strip.text)
<br>

---

## Adding a plot title and axis labels

ggtitle
xlab
ylab

<br>

---

## Challenge solutions

<!--sec data-title="Solution to Challenge 1" data-id="ch1sol" data-show=true data-collapse=true ces-->


~~~sourcecode
ggplot(data = na.omit(msleep), 
       aes(x = bodywt, y = brainwt, colour = sleep_total)) +
  geom_point(shape = 2)
~~~

<img src="images/custom-unnamed-chunk-5-1.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" style="display: block; margin: auto;" />

<!--endsec-->
