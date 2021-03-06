module Transform
    exposing
        ( Transform
        , default
        , translateX
        , translateY
        , translateZ
        , transformToCouples
        , rotateX
        , rotateY
        , rotateZ
        )

{-| Transform contains everything about css transformations : translate, rotate and scale.


# Types

@docs Transform

# Default transform

@docs default


# Shadow modifiers

@docs translateX
@docs translateY
@docs translateZ
@docs rotateX
@docs rotateY
@docs rotateZ

# Compilation

@docs transformToCouples

-}

import Helpers.Shared exposing (..)
import Elegant.Setters exposing (..)
import Modifiers exposing (..)


type alias Triplet a =
    ( a, a, a )


{-| The Transform record contains everything about transformations.
You probably won't use it as is, but instead using `Box.transform`
which automatically generate an empty `Transform` record. You
can then use modifiers. I.E.

    Box.transform
        [ Transform.translateX (px 30)
        , Transform.translateY (vw 30)
        ]

-}
type alias Transform =
    { translate : Triplet (Maybe SizeUnit)
    , rotate : Triplet (Maybe Angle)

    -- , scale : Triplet Scale
    }


{-| Generate an empty `Translate` record, with every field equal to Nothing.
You are free to use it as you wish, but it is instanciated automatically by `Box.translate`.
-}
default : Transform
default =
    Transform ( Nothing, Nothing, Nothing ) ( Nothing, Nothing, Nothing )


{-| Set the translateX of the Transform.
-}
translateX : SizeUnit -> Modifier Transform
translateX a transform =
    case transform.translate of
        ( x, y, z ) ->
            setTranslate ( Just a, y, z ) transform


{-| Set the translateY of the Transform.
-}
translateY : SizeUnit -> Modifier Transform
translateY a transform =
    case transform.translate of
        ( x, y, z ) ->
            setTranslate ( x, Just a, z ) transform


{-| Set the translateZ of the Transform.
-}
translateZ : SizeUnit -> Modifier Transform
translateZ a transform =
    case transform.translate of
        ( x, y, z ) ->
            setTranslate ( x, y, Just a ) transform


{-| Set the rotateX of the Transform.
-}
rotateX : Angle -> Modifier Transform
rotateX a transform =
    case transform.rotate of
        ( x, y, z ) ->
            setRotate ( Just a, y, z ) transform


{-| Set the rotateY of the Transform.
-}
rotateY : Angle -> Modifier Transform
rotateY a transform =
    case transform.rotate of
        ( x, y, z ) ->
            setRotate ( x, Just a, z ) transform


{-| Set the translateZ of the Transform.
-}
rotateZ : Angle -> Modifier Transform
rotateZ a transform =
    case transform.rotate of
        ( x, y, z ) ->
            setRotate ( x, y, Just a ) transform


{-| Compiles a `Transform` record to the corresponding CSS tuple.
Compiles only parts which are defined, ignoring `Nothing` fields.
-}
transformToCouples : Transform -> List ( String, String )
transformToCouples transform =
    [ ( "transform", transformToString transform ) ]



-- Internals


translateCoordinateToString : ( String, Maybe SizeUnit ) -> List String
translateCoordinateToString ( coord, val ) =
    case val of
        Nothing ->
            []

        Just val ->
            [ "translate" ++ coord ++ "(" ++ (sizeUnitToString val) ++ ")"
            ]


rotateCoordinateToString : ( String, Maybe Angle ) -> List String
rotateCoordinateToString ( coord, val ) =
    case val of
        Nothing ->
            []

        Just val ->
            [ "rotate" ++ coord ++ "(" ++ (angleToString val) ++ ")"
            ]


translateToStringList : Triplet (Maybe SizeUnit) -> List String
translateToStringList ( maybeX, maybeY, maybeZ ) =
    [ ( "X", maybeX )
    , ( "Y", maybeY )
    , ( "Z", maybeZ )
    ]
        |> List.concatMap
            translateCoordinateToString


rotateToStringList : Triplet (Maybe Angle) -> List String
rotateToStringList ( maybeX, maybeY, maybeZ ) =
    [ ( "X", maybeX )
    , ( "Y", maybeY )
    , ( "Z", maybeZ )
    ]
        |> List.concatMap
            rotateCoordinateToString


transformToString : Transform -> String
transformToString { translate, rotate } =
    ([ rotateToStringList rotate
     , translateToStringList translate
     ]
        |> List.concat
        |> String.join " "
    )
