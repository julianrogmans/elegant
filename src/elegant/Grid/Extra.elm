module Grid.Extra
    exposing
        ( alignedCell
        , cell
        )

{-|
@docs alignedCell
@docs cell
-}

import BodyBuilder as Builder exposing (Node)
import BodyBuilder.Attributes as Attributes
import Style
import Grid
import Flex
import Flex.Extra


{-|
a cell inside a grid with alignement of it's content
-}
alignedCell :
    List (Attributes.StyleModifier (Attributes.GridItemAttributes msg))
    -> ( Int, Int )
    -> ( Int, Int )
    -> ( Flex.Align, Flex.JustifyContent )
    -> List (Node msg)
    -> Builder.GridItem msg
alignedCell cellStyle ( x, y ) ( width, height ) alignment content =
    cell cellStyle ( x, y ) ( width, height ) [ Flex.Extra.alignedContent alignment content ]


{-|
a cell inside a grid with beginning coordinates and size
-}
cell :
    List (Attributes.StyleModifier (Attributes.GridItemAttributes msg))
    -> ( Int, Int )
    -> ( Int, Int )
    -> List (Node msg)
    -> Builder.GridItem msg
cell cellStyle ( x, y ) ( width, height ) =
    Builder.gridItem
        [ Attributes.style
            ([ Style.gridItemProperties
                [ Grid.horizontal
                    [ Grid.placement x
                    , Grid.size (Grid.span width)
                    , Grid.align Grid.stretch
                    ]
                , Grid.vertical
                    [ Grid.placement y
                    , Grid.size (Grid.span height)
                    , Grid.align Grid.stretch
                    ]
                ]
             ]
                ++ cellStyle
            )
        ]
