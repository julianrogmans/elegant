module Main exposing (..)

import BodyBuilder as Builder exposing (Node)
import BodyBuilder.Attributes as Attributes
import Elegant exposing (px, Style)
import Box
import Typography
import Style
import Block


theFontSize : number
theFontSize =
    15


view : a -> Node msg
view model =
    Builder.node
        [ Attributes.style
            [ Style.block
                [ Block.alignCenter ]
            ]
        ]
        [ Builder.h1 []
            [ Builder.text "I'm Elegantly styled by css" ]
        , Builder.p
            [ Attributes.style
                [ Style.box
                    [ Box.typography
                        [ Typography.size (px theFontSize) ]
                    ]
                , Style.box
                    [ Box.typography
                        [ Typography.size (px (theFontSize + 5)) ]
                    ]
                    |> Style.pseudoClass "hover"
                ]
            ]
            [ Builder.text "Go Hover Me ! My style is set in my node, so it's parametrizable, but the result is a good old css node (look at the dom Luke)" ]
        ]


main : Program Basics.Never Int msg
main =
    Builder.program
        { init = ( 0, Cmd.none )
        , update = (\msg model -> ( model, Cmd.none ))
        , subscriptions = always Sub.none
        , view = view
        }
