# SVG (Scalable Vector Graphics)

#### Examples
###### circle

    <svg width="50" height="50">
      <circle cx="25" cy="25" r="22" fill="blue" stroke="gray" stroke-width="2"/>
    </svg>

###### rectangle

    <svg width="750" height="100">
      <rect x="0" y="0" width="500" height="50"/>
    </svg>

###### ellipse

    <svg width="500" height="250">
      <ellipse cx="250" cy="25" rx="100" ry="25"/>
    </svg>

###### line

    <svg width="750" height="250">
      <line x1="0" y1="0" x2="500" y2="50" stroke="black"/>
    </svg>

###### text

    <svg width="500" height="250">
      <text x="250" y="25" font-family="serif" font-size="25" fill="gray">Some Text</text>
    </svg>

#### Styling svg elements
+ fill    (the color that an element is filled with, can be rgb, hex, or predefined colors)
+ stroke  (outline of a shape, must be a color value)
+ stroke-width (width of a stroke, numerical typically in pixels)
+ opacity  (value is between 0.0(completely transparent) and 1.0(completely opaque))
+ font-family   (applies to text element only)
+ font-size     (applies to text element only)

