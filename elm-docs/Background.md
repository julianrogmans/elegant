# Background

Background contains everything about background rendering: using photos or gradient,
and positionning them on the page.


# Types

- [Background](#background)

### **type alias Background**
```elm
type alias Background  =
    Background Nothing []



images : List BackgroundImage -> Modifier Background
images images =
    setImages images



type Image
    = Gradient Gradient
    | Source String



type alias BackgroundImage =
    { image : Maybe Image
    , position : Maybe (Vector SizeUnit)
    }
```

The `Background` record contains everything about background rendering,
including character rendering. You probably won't use it as is, but instead using
`Box.background` which automatically generate an empty `Background` record. You
can then use modifiers. I.E.

```elm
Box.background
```

        [ Elegant.color Color.white
        , Background.images
            [ Background.image "/example.photo" ]
        ]
- [Image](#image)

### **type Image**
```elm
type Image   
    = 
```

Represents an image in CSS. It can be an image, represented by a source url, or
a gradiant. They are instanciated by `image` (which instanciate an Image inside a
`BackgroundImage`) or by `linear` or `radial`, instanciating a gradiant.
- [BackgroundImage](#backgroundimage)

### **type alias BackgroundImage**
```elm
type alias BackgroundImage  =  
    { image : Maybe Background.Image , position : Maybe (Helpers.Vector.Vector Helpers.Shared.SizeUnit) }
```

Represents a Background Image, i.e. an image in Background. Contrary to `Image`,
a `BackgroundImage` contains an image and a position. This position set the position of the image
on the background.
- [Gradient](#gradient)

### **type Gradient**
```elm
type Gradient   
    = 
```

Defines a gradient, which can be either linear or radial. They are instanciated
by the corresponding functions.
- [Angle](#angle)

### **type Angle**
```elm
type Angle   
    = 
```

Represents an angle. Can be either radiant or degree.
- [Degree](#degree)

### **type alias Degree**
```elm
type alias Degree  =  
    Float
```

Represents a degree.
- [Radiant](#radiant)

### **type alias Radiant**
```elm
type alias Radiant  =
    Float



rad : Float -> Angle
rad =
    Rad



degree : Float -> Angle
degree =
    Deg



type alias ColorStop =
    { position : Maybe SizeUnit
    , color : Color
    }
```

Represents a radiant.
- [ColorStop](#colorstop)

### **type alias ColorStop**
```elm
type alias ColorStop  =  
    { position : Maybe Helpers.Shared.SizeUnit , color : Color }
```

Represents a CSS Color Stop, which contains a Color, and possibly a position.
This is automatically generated by `colorStop`.


# Background creation

- [default](#default)

### **default**
```elm
default : Background

```

Generates an empty `Background`.
- [images](#images)

### **images**
```elm
images : List BackgroundImage
    }



default : Background
default =
    Background Nothing []




```

Modify the background rendering to add photos and gradients.
It modifies the images list in `Background`.

```elm
Background.images
```

        [ Background.image "/example.photo" ]
- [image](#image-1)

### **image**
```elm
image : Maybe Image
    , position : Maybe (Vector SizeUnit)
    }


defaultBackgroundImage : BackgroundImage
defaultBackgroundImage =
    BackgroundImage Nothing (Just ( Percent 0, Percent 0 ))




```

Accepts an Url, and returns a `BackgroundImage`. This image can be modified
to add a position to it.
- [gradient](#gradient-1)

### **gradient**
```elm
gradient : Gradient -> BackgroundImage

```

Accepts a gradient, and creates a `BackgroundImage`.
- [linear](#linear)

### **linear**
```elm
linear : Angle -> ColorStop -> ColorStop -> Gradient

```

Creates a linear gradient. The angle, and two colors (one for starting color,
the second for the ending color) are required, and more colors can be added in the
gradient using `intermediateColors`.
- [radial](#radial)

### **radial**
```elm
radial : ColorStop -> ColorStop -> Gradient

```

Creates a radial gradient. Two colors (one for starting color, the second
for the ending color) are required, and more colors can be added in the gradient
using `intermediateColors`.


# Background modifiers

- [intermediateColors](#intermediatecolors)

### **intermediateColors**
```elm
intermediateColors : List ColorStop -> Modifier Gradient

```

Sets multiples intermediate colors in a gradient.
By default, a gradient is created with two colors. This can be used to add
more colors.
- [colorStop](#colorstop-1)

### **colorStop**
```elm
colorStop : Color -> ColorStop

```

Generates a CSS Color Stop from Color to use in gradients.
- [at](#at)

### **at**
```elm
at : a -> { b | position : Maybe a } -> { b | position : Maybe a }

```

Sets a position on both a gradient and a `BackgroundImage`.
- [degree](#degree-1)

### **degree**
```elm
degree : Float -> Angle

```

Generates an angle in degree from Float.
- [rad](#rad)

### **rad**
```elm
rad : Float -> Angle

```

Generates an angle in radiant from Float.


# Compilation

- [backgroundToCouples](#backgroundtocouples)

### **backgroundToCouples**
```elm
backgroundToCouples : Background -> List ( String, String )

```

Compiles a `Background` record to the corresponding CSS list of tuples.
Compiles only styles which are defined, ignoring `Nothing` fields.

