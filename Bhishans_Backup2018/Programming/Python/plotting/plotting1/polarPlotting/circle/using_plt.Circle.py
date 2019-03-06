#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Author  : Bhishan Poudel
# Date    : Apr 01, 2016
# Tutorial : http://matplotlib.org/api/patches_api.html#matplotlib.patches.Circle
# Tutorial : http://matplotlib.org/api/artist_api.html#matplotlib.patches.Circle

# Imports
import matplotlib.pyplot as plt

circle1=plt.Circle((0,0),.2,color='r',fill=False) # center, radius
circle2=plt.Circle((.5,.5),.2,color='b')
circle3=plt.Circle((1,1),.2,color='g',clip_on=False)

fig = plt.gcf()
fig.gca().add_artist(circle1)
fig.gca().add_artist(circle2)
fig.gca().add_artist(circle3)


#fig.savefig('plotcircles.png')
plt.show()

# A Circle is a subclass of an Artist, and an axes has an add_artist method.
# syntax: class matplotlib.patches.Circle(xy, radius=5, **kwargs)


#class matplotlib.patches.Circle(xy, radius=5, **kwargs)

    #Bases: matplotlib.patches.Ellipse

    #A circle patch.

    #Create true circle at center xy = (x, y) with given radius. Unlike CirclePolygon which is a polygonal approximation, this uses Bézier splines and is much closer to a scale-free circle.

    #Valid kwargs are:

#	Property 		Description

#	agg_filter 			unknown
#	alpha 				float or None
#	animated 			[True | False]
#	antialiased or aa 	[True | False] or None for default
#	axes 				an Axes instance
#	capstyle 			[‘butt’ | ‘round’ | ‘projecting’]
#	clip_box 			a matplotlib.transforms.Bbox instance
#	clip_on 			[True | False]
#	clip_path 			[ (Path, Transform) | Patch | None ]
#	color 				matplotlib color spec
#	contains 			a callable function
#	edgecolor or ec 	mpl color spec, or None for default, or ‘none’ for no color
#	facecolor or fc 	mpl color spec, or None for default, or ‘none’ for no color
#	figure 				a matplotlib.figure.Figure instance
#	fill 				[True | False]
#	gid 				an id string
#	hatch 				[‘/’ | ‘\’ | ‘|’ | ‘-‘ | ‘+’ | ‘x’ | ‘o’ | ‘O’ | ‘.’ | ‘*’]
#	joinstyle 			[‘miter’ | ‘round’ | ‘bevel’]
#	label 				string or anything printable with ‘%s’ conversion.
#	linestyle or ls 	[‘solid’ | ‘dashed’, ‘dashdot’, ‘dotted’ | (offset, on-off-dash-seq) | '-' | '--' | '-.' | ':' | 'None' | ' ' | '']
#	linewidth or lw 	float or None for default
#	path_effects 		unknown
#	picker 				[None|float|boolean|callable]
#	rasterized 			[True | False | None]
#	sketch_params 		unknown
#	snap 				unknown
#	transform 			Transform instance
#	url 				a url string
#	visible 			[True | False]
#	zorder 				any number

    #get_radius()

        #return the radius of the circle

    #radius

        #return the radius of the circle

    #set_radius(radius)

        #Set the radius of the circle

        #ACCEPTS: float


