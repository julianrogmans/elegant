module BodyBuilder.Attributes
    exposing
        ( StyleSelector
        , defaultStyleSelector
        , MediaQuery(..)
        , StyleModifier
        , style
        , rawStyle
        , AutocompleteAttribute
        , WidthAttribute
        , HeightAttribute
        , ValueAttribute
        , StepAttribute
        , MaxAttribute
        , MinAttribute
        , TargetAttribute
        , HrefAttribute
        , NameAttribute
        , DisabledAttribute
        , MaybeBlockContainer
        , BlockContainer
        , PlaceholderAttribute
        , PositionAttribute
        , DataAttribute
        , TypeContainer
        , BoxContainer
        , CheckedContainer
        , UniversalContainer
        , FlexContainerProperties
        , FlexItemProperties
        , GridContainerProperties
        , GridItemProperties
        , Position
        , VisibleAttributes
        , VisibleAttributesAndEvents
        , InputPasswordAttributes
        , InputRangeAttributes
        , SelectAttributes
        , UniversalAttributes
        , FlowAttributes
        , NodeAttributes
        , FlexContainerAttributes
        , FlexItemAttributes
        , GridContainerAttributes
        , GridItemAttributes
        , BlockAttributes
        , HeadingAttributes
        , ButtonAttributes
        , AAttributes
        , TextareaAttributes
        , ImgAttributes
        , AudioAttributes
        , ProgressAttributes
        , ScriptAttributes
        , InputAttributes
        , InputHiddenAttributes
        , LabelAttributes
        , InputRadioAttributes
        , InputCheckboxAttributes
        , InputTextAttributes
        , InputTelAttributes
        , InputSubmitAttributes
        , InputUrlAttributes
        , InputNumberAttributes
        , InputColorAttributes
        , InputFileAttributes
        , label
        , value
        , title
        , id
        , class
        , tabindex
        , disabled
        , target
        , href
        , name
        , width
        , height
        , data
        , autocomplete
        , placeholder
        , step
        , max
        , min
        , checked
        , defaultUniversalAttributes
        , defaultFlowAttributes
        , defaultNodeAttributes
        , defaultFlexContainerAttributes
        , defaultGridContainerAttributes
        , defaultHeadingAttributes
        , defaultFlexItemAttributes
        , defaultGridItemAttributes
        , defaultButtonAttributes
        , defaultAAttributes
        , defaultTextareaAttributes
        , defaultImgAttributes
        , defaultAudioAttributes
        , defaultProgressAttributes
        , defaultScriptAttributes
        , defaultInputHiddenAttributes
        , defaultInputTextAttributes
        , defaultInputTelAttributes
        , defaultInputNumberAttributes
        , defaultInputColorAttributes
        , defaultInputCheckboxAttributes
        , defaultInputFileAttributes
        , defaultInputPasswordAttributes
        , defaultInputRadioAttributes
        , defaultInputRangeAttributes
        , defaultInputSubmitAttributes
        , defaultInputUrlAttributes
        , defaultSelectAttributes
        , universalAttributesToHtmlAttributes
        , visibleAttributesToHtmlAttributes
        , rawStyleToHtmlAttributes
        , flowAttributesToHtmlAttributes
        , nodeAttributesToHtmlAttributes
        , flexContainerAttributesToHtmlAttributes
        , flexItemAttributesToHtmlAttributes
        , gridContainerAttributesToHtmlAttributes
        , gridItemAttributesToHtmlAttributes
        , headingAttributesToHtmlAttributes
        , disabledAttributeToHtmlAttributes
        , buttonAttributesToHtmlAttributes
        , aAttributesToHtmlAttributes
        , textareaAttributesToHtmlAttributes
        , imgAttributesToHtmlAttributes
        , audioAttributesToHtmlAttributes
        , progressAttributesToHtmlAttributes
        , scriptAttributesToHtmlAttributes
        , inputAttributesToHtmlAttributes
        , inputHiddenAttributesToHtmlAttributes
        , inputVisibleToHtmlAttributes
        , inputTextAttributesToHtmlAttributes
        , inputNumberAttributesToHtmlAttributes
        , inputColorAttributesToHtmlAttributes
        , inputCheckboxAttributesToHtmlAttributes
        , inputFileAttributesToHtmlAttributes
        , inputPasswordAttributesToHtmlAttributes
        , inputRadioAttributesToHtmlAttributes
        , inputRangeAttributesToHtmlAttributes
        , inputSubmitAttributesToHtmlAttributes
        , inputUrlAttributesToHtmlAttributes
        , selectAttributesToHtmlAttributes
        )

{-| This module entirely replaces Html.Attributes, providing a type-safer alternatives.
This is designed to work with BodyBuilder.
It is not compatible with Html.Attributes, though.

@docs StyleSelector, defaultStyleSelector
@docs MediaQuery
@docs StyleModifier, style, rawStyle
@docs AutocompleteAttribute, WidthAttribute
@docs HeightAttribute
@docs ValueAttribute
@docs StepAttribute
@docs MaxAttribute
@docs MinAttribute
@docs TargetAttribute
@docs HrefAttribute
@docs NameAttribute
@docs DisabledAttribute
@docs PlaceholderAttribute
@docs DataAttribute, data
@docs TypeContainer
@docs BoxContainer
@docs CheckedContainer
@docs UniversalContainer, title, id, class, tabindex
@docs MaybeBlockContainer
@docs BlockContainer
@docs FlexContainerProperties
@docs FlexItemProperties
@docs GridContainerProperties
@docs GridItemProperties
@docs VisibleAttributes, visibleAttributesToHtmlAttributes, rawStyleToHtmlAttributes
@docs VisibleAttributesAndEvents
@docs UniversalAttributes, defaultUniversalAttributes, universalAttributesToHtmlAttributes
@docs NodeAttributes, defaultNodeAttributes, nodeAttributesToHtmlAttributes
@docs BlockAttributes, width, height
@docs HeadingAttributes, defaultHeadingAttributes, headingAttributesToHtmlAttributes
@docs FlowAttributes, defaultFlowAttributes, flowAttributesToHtmlAttributes
@docs FlexContainerAttributes, defaultFlexContainerAttributes, flexContainerAttributesToHtmlAttributes
@docs FlexItemAttributes, defaultFlexItemAttributes, flexItemAttributesToHtmlAttributes
@docs GridContainerAttributes, defaultGridContainerAttributes, gridContainerAttributesToHtmlAttributes
@docs GridItemAttributes, defaultGridItemAttributes, gridItemAttributesToHtmlAttributes
@docs ButtonAttributes, defaultButtonAttributes, buttonAttributesToHtmlAttributes
@docs AAttributes, target, href, defaultAAttributes, aAttributesToHtmlAttributes
@docs ImgAttributes, defaultImgAttributes, imgAttributesToHtmlAttributes
@docs AudioAttributes, defaultAudioAttributes, audioAttributesToHtmlAttributes
@docs ScriptAttributes, defaultScriptAttributes, scriptAttributesToHtmlAttributes
@docs ProgressAttributes, defaultProgressAttributes, progressAttributesToHtmlAttributes
@docs SelectAttributes, defaultSelectAttributes, selectAttributesToHtmlAttributes
@docs LabelAttributes, label, PositionAttribute, Position
@docs InputAttributes, value, disabled, name, disabledAttributeToHtmlAttributes, inputAttributesToHtmlAttributes, inputVisibleToHtmlAttributes
@docs InputHiddenAttributes, name, defaultInputHiddenAttributes, inputHiddenAttributesToHtmlAttributes
@docs InputPasswordAttributes, name, defaultInputPasswordAttributes, inputPasswordAttributesToHtmlAttributes
@docs InputRangeAttributes, name, step, max, min, defaultInputRangeAttributes, inputRangeAttributesToHtmlAttributes
@docs InputRadioAttributes, name, defaultInputRadioAttributes, inputRadioAttributesToHtmlAttributes
@docs InputCheckboxAttributes, name, checked, defaultInputCheckboxAttributes, inputCheckboxAttributesToHtmlAttributes
@docs InputTextAttributes, name, autocomplete, placeholder, defaultInputTextAttributes, inputTextAttributesToHtmlAttributes
@docs InputTelAttributes, defaultInputTelAttributes
@docs InputSubmitAttributes, name, defaultInputSubmitAttributes, inputSubmitAttributesToHtmlAttributes
@docs InputUrlAttributes, name, placeholder, defaultInputUrlAttributes, inputUrlAttributesToHtmlAttributes
@docs InputNumberAttributes, name, step, max, min, defaultInputNumberAttributes, inputNumberAttributesToHtmlAttributes
@docs InputColorAttributes, name, defaultInputColorAttributes, inputColorAttributesToHtmlAttributes
@docs InputFileAttributes, name, defaultInputFileAttributes, inputFileAttributesToHtmlAttributes
@docs TextareaAttributes, autocomplete, placeholder, defaultTextareaAttributes, textareaAttributesToHtmlAttributes

-}

import Html exposing (Html)
import Html.Attributes
import Color exposing (Color)
import Color.Convert
import Box
import Display exposing (BlockDetails)
import Helpers.Shared exposing (..)
import BodyBuilder.Events exposing (..)
import Function
import Json.Decode exposing (Decoder)
import Flex
import BodyBuilder.Shared as Shared
import Grid
import Elegant
import BodyBuilder.Setters exposing (..)
import Modifiers exposing (..)


{-| -}
type alias StyleSelector =
    { media : Maybe MediaQuery
    , pseudoClass : Maybe String
    }


{-| -}
defaultStyleSelector : StyleSelector
defaultStyleSelector =
    StyleSelector Nothing Nothing


{-| -}
type MediaQuery
    = Greater Int
    | Lesser Int
    | Between Int Int


{-| -}
type alias StyleModifier a =
    StyleSelector -> Modifier a


{-| -}
style : List (StyleModifier a) -> Modifier a
style styles =
    styles
        |> List.map (callOn defaultStyleSelector)
        |> Function.compose


{-| -}
rawStyle : a -> { c | rawStyle : b } -> { c | rawStyle : Maybe a }
rawStyle theStyle attrs =
    { attrs | rawStyle = Just theStyle }


{-| -}
type alias ValueAttribute b a =
    { a | value : Maybe b }


{-| -}
type alias StepAttribute a =
    { a | step : Maybe Int }


{-| -}
type alias MaxAttribute a =
    { a | max : Maybe Int }


{-| -}
type alias MinAttribute a =
    { a | min : Maybe Int }


{-| -}
type alias TargetAttribute a =
    { a | target : Maybe String }


{-| -}
type alias HrefAttribute a =
    { a | href : Maybe String }


{-| -}
type alias NameAttribute a =
    { a | name : Maybe String }


{-| -}
type alias WidthAttribute a =
    { a | width : Maybe Int }


{-| -}
type alias HeightAttribute a =
    { a | height : Maybe Int }


{-| -}
type alias DisabledAttribute a =
    { a | disabled : Bool }


{-| -}
type alias MaybeBlockContainer a =
    { a | block : Maybe (List ( Modifiers BlockDetails, StyleSelector )) }


{-| -}
type alias BlockContainer a =
    { a | block : List ( Modifiers BlockDetails, StyleSelector ) }


{-| -}
type alias AutocompleteAttribute a =
    { a | autocomplete : Bool }


{-| -}
type alias PlaceholderAttribute a =
    { a | placeholder : Maybe String }


{-| -}
type alias PositionAttribute a =
    { a | position : Position }


{-| -}
type alias DataAttribute a =
    { a | data : List ( String, String ) }


{-| -}
type alias TypeContainer a =
    { a | type_ : String }


{-| -}
type alias BoxContainer a =
    { a | box : List ( Modifiers Box.Box, StyleSelector ) }


{-| -}
type alias CheckedContainer a =
    { a | checked : Bool }


{-| -}
type alias UniversalContainer a =
    { a | universal : UniversalAttributes }


{-| -}
type alias FlexContainerProperties a =
    { a | flexContainerProperties : List ( Modifiers Flex.FlexContainerDetails, StyleSelector ) }


{-| -}
type alias FlexItemProperties a =
    { a | flexItemProperties : List ( Modifiers Flex.FlexItemDetails, StyleSelector ) }


{-| -}
type alias GridContainerProperties a =
    { a | gridContainerProperties : List ( Modifiers Grid.GridContainerDetails, StyleSelector ) }


{-| -}
type alias GridItemProperties a =
    { a | gridItemProperties : List ( Modifiers Grid.GridItemDetails, StyleSelector ) }


{-| -}
type Position
    = Before
    | After


{-| Computed : BoxContainer (UniversalContainer a)
-}
type alias VisibleAttributes a =
    { a
        | box : List ( Modifiers Box.Box, StyleSelector )
        , universal : UniversalAttributes
        , rawStyle : Maybe Elegant.Style
    }


{-| -}
type alias StringValue a =
    ValueAttribute String a


{-| -}
type alias IntValue a =
    ValueAttribute Int a


{-| -}
type alias ColorValue a =
    ValueAttribute Color a


{-| OnEvent msg (OnFocusEvent msg (OnBlurEvent msg (OnMouseEvents msg (VisibleAttributes a))))
-}
type alias VisibleAttributesAndEvents msg a =
    { a
        | onMouseEvents : Maybe (OnMouseEventsInside msg)
        , onEvent : Maybe ( String, Decoder msg )
        , onBlurEvent : Maybe msg
        , onFocusEvent : Maybe msg
        , box : List ( Modifiers Box.Box, StyleSelector )
        , universal : UniversalAttributes
        , rawStyle : Maybe Elegant.Style
    }


{-| -}
type alias InputPasswordAttributes msg =
    InputTextAttributes msg


{-| -}
type alias InputRangeAttributes msg =
    InputNumberAttributes msg


{-| Computed : -- MaybeBlockContainer (StringValue (FlowAttributes msg))
-}
type alias SelectAttributes msg =
    { block : Maybe (List ( Modifiers BlockDetails, StyleSelector ))
    , value : Maybe String
    , onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , box : List ( Modifiers Box.Box, StyleSelector )
    , universal : UniversalAttributes
    , rawStyle : Maybe Elegant.Style
    , onInputEvent : Maybe (String -> msg)
    , fromStringInput : String -> String
    }


{-| TitleAttribute (TabindexAttribute (IdAttribute (ClassAttribute {})))
-}
type alias UniversalAttributes =
    { title : Maybe String
    , tabindex : Maybe Int
    , id : Maybe String
    , class : List String
    }


{-| -}
type alias FlowAttributes msg =
    { onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , box : List ( Modifiers Box.Box, StyleSelector )
    , universal : UniversalAttributes
    , rawStyle : Maybe Elegant.Style
    }


{-| Computed : MaybeBlockContainer (FlowAttributes msg)
-}
type alias NodeAttributes msg =
    { onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , box : List ( Modifiers Box.Box, StyleSelector )
    , universal : UniversalAttributes
    , block : Maybe (List ( Modifiers BlockDetails, StyleSelector ))
    , rawStyle : Maybe Elegant.Style
    }



-- FlexContainerProperties (NodeAttributes msg)


{-| -}
type alias FlexContainerAttributes msg =
    { flexContainerProperties : List ( Modifiers Flex.FlexContainerDetails, StyleSelector )
    , onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , box : List ( Modifiers Box.Box, StyleSelector )
    , universal : UniversalAttributes
    , block : Maybe (List ( Modifiers BlockDetails, StyleSelector ))
    , rawStyle : Maybe Elegant.Style
    }



-- FlexItemProperties (NodeAttributes msg)


{-| -}
type alias FlexItemAttributes msg =
    { flexItemProperties : List ( Modifiers Flex.FlexItemDetails, StyleSelector )
    , onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , box : List ( Modifiers Box.Box, StyleSelector )
    , universal : UniversalAttributes
    , block : Maybe (List ( Modifiers BlockDetails, StyleSelector ))
    , rawStyle : Maybe Elegant.Style
    }



-- GridContainerProperties (NodeAttributes msg)


{-| -}
type alias GridContainerAttributes msg =
    { gridContainerProperties : List ( Modifiers Grid.GridContainerDetails, StyleSelector )
    , onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , box : List ( Modifiers Box.Box, StyleSelector )
    , universal : UniversalAttributes
    , block : Maybe (List ( Modifiers BlockDetails, StyleSelector ))
    , rawStyle : Maybe Elegant.Style
    }



-- GridItemProperties (NodeAttributes msg)


{-| -}
type alias GridItemAttributes msg =
    { gridItemProperties : List ( Modifiers Grid.GridItemDetails, StyleSelector )
    , onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , box : List ( Modifiers Box.Box, StyleSelector )
    , universal : UniversalAttributes
    , block : Maybe (List ( Modifiers BlockDetails, StyleSelector ))
    , rawStyle : Maybe Elegant.Style
    }



-- BlockContainer (FlowAttributes msg)


{-| -}
type alias BlockAttributes msg =
    { block : List ( Modifiers BlockDetails, StyleSelector )
    , onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , box : List ( Modifiers Box.Box, StyleSelector )
    , universal : UniversalAttributes
    , rawStyle : Maybe Elegant.Style
    }


{-| -}
type alias HeadingAttributes msg =
    BlockAttributes msg


{-| -}
type alias ButtonAttributes msg =
    { disabled : Bool
    , block : Maybe (List ( Modifiers BlockDetails, StyleSelector ))
    , onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , box : List ( Modifiers Box.Box, StyleSelector )
    , universal : UniversalAttributes
    , rawStyle : Maybe Elegant.Style
    }


{-| -}
type alias AAttributes msg =
    { onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , box : List ( Modifiers Box.Box, StyleSelector )
    , universal : UniversalAttributes
    , href : Maybe String
    , target : Maybe String
    , block : Maybe (List ( Modifiers BlockDetails, StyleSelector ))
    , rawStyle : Maybe Elegant.Style
    }


{-| -}
type alias TextareaAttributes msg =
    { onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , box : List ( Modifiers Box.Box, StyleSelector )
    , universal : UniversalAttributes
    , value : Maybe String
    , onInputEvent : Maybe (String -> msg)
    , fromStringInput : String -> String
    , name : Maybe String
    , block : Maybe (List ( Modifiers BlockDetails, StyleSelector ))
    , rawStyle : Maybe Elegant.Style
    }


{-| -}
type alias ImgAttributes msg =
    { onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , box : List ( Modifiers Box.Box, StyleSelector )
    , universal : UniversalAttributes
    , src : String
    , alt : String
    , width : Maybe Int
    , height : Maybe Int
    , block : Maybe (List ( Modifiers BlockDetails, StyleSelector ))
    , rawStyle : Maybe Elegant.Style
    }


{-| -}
type alias AudioAttributes msg =
    { onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , box : List ( Modifiers Box.Box, StyleSelector )
    , universal : UniversalAttributes
    , src : String
    , block : Maybe (List ( Modifiers BlockDetails, StyleSelector ))
    , rawStyle : Maybe Elegant.Style
    }


{-| -}
type alias ProgressAttributes msg =
    { onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , box : List ( Modifiers Box.Box, StyleSelector )
    , universal : UniversalAttributes
    , block : Maybe (List ( Modifiers BlockDetails, StyleSelector ))
    , rawStyle : Maybe Elegant.Style
    }


{-| -}
type alias ScriptAttributes msg =
    { onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , box : List ( Modifiers Box.Box, StyleSelector )
    , universal : UniversalAttributes
    , src : String
    , data : List ( String, String )
    , rawStyle : Maybe Elegant.Style
    }


{-| -}
type alias InputAttributes a =
    { a | type_ : String, name : Maybe String }


{-| -}
type alias InputHiddenAttributes =
    { name : Maybe String, type_ : String, value : Maybe String, universal : UniversalAttributes }


{-| -}
type alias LabelAttributes msg =
    { onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , box : List ( Modifiers Box.Box, StyleSelector )
    , universal : UniversalAttributes
    , position : Position
    , block : Maybe (List ( Modifiers BlockDetails, StyleSelector ))
    , rawStyle : Maybe Elegant.Style
    }


{-| -}
type alias InputRadioAttributes msg =
    { name : Maybe String
    , type_ : String
    , universal : UniversalAttributes
    , box : List ( Modifiers Box.Box, StyleSelector )
    , onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , value : Maybe String
    , block : Maybe (List ( Modifiers Display.BlockDetails, StyleSelector ))
    , label : Maybe (Shared.Label msg)
    , rawStyle : Maybe Elegant.Style
    }


{-| -}
type alias InputCheckboxAttributes msg =
    { name : Maybe String
    , type_ : String
    , universal : UniversalAttributes
    , box : List ( Modifiers Box.Box, StyleSelector )
    , onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , value : Maybe String
    , label : Maybe (Shared.Label msg)
    , block : Maybe (List ( Modifiers BlockDetails, StyleSelector ))
    , checked : Bool
    , onCheckEvent : Maybe (Bool -> msg)
    , rawStyle : Maybe Elegant.Style
    }


{-| -}
type alias InputTextAttributes msg =
    { name : Maybe String
    , type_ : String
    , universal : UniversalAttributes
    , box : List ( Modifiers Box.Box, StyleSelector )
    , onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , value : Maybe String
    , label : Maybe (Shared.Label msg)
    , placeholder : Maybe String
    , autocomplete : Bool
    , onInputEvent : Maybe (String -> msg)
    , fromStringInput : String -> String
    , block : Maybe (List ( Modifiers BlockDetails, StyleSelector ))
    , rawStyle : Maybe Elegant.Style
    }


{-| -}
type alias InputTelAttributes msg =
    InputTextAttributes msg


{-| -}
type alias InputSubmitAttributes msg =
    { label : Maybe (Shared.Label msg)
    , type_ : String
    , disabled : Bool
    , block : Maybe (List ( Modifiers BlockDetails, StyleSelector ))
    , onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , onSubmitEvent : Maybe msg
    , box : List ( Modifiers Box.Box, StyleSelector )
    , universal : UniversalAttributes
    , rawStyle : Maybe Elegant.Style
    }


{-| -}
type alias InputUrlAttributes msg =
    InputTextAttributes msg


{-| -}
type alias InputNumberAttributes msg =
    { name : Maybe String
    , type_ : String
    , universal : UniversalAttributes
    , box : List ( Modifiers Box.Box, StyleSelector )
    , onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , label : Maybe (Shared.Label msg)
    , rawStyle : Maybe Elegant.Style
    , value : Maybe Int
    , onInputEvent : Maybe (Int -> msg)
    , fromStringInput : String -> Int
    , step : Maybe Int
    , max : Maybe Int
    , min : Maybe Int
    , block : Maybe (List ( Modifiers BlockDetails, StyleSelector ))
    , disabled : Bool
    }


{-| -}
type alias InputColorAttributes msg =
    { name : Maybe String
    , type_ : String
    , universal : UniversalAttributes
    , box : List ( Modifiers Box.Box, StyleSelector )
    , onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , label : Maybe (Shared.Label msg)
    , rawStyle : Maybe Elegant.Style
    , value : Maybe Color
    , onInputEvent : Maybe (Color -> msg)
    , fromStringInput : String -> Color
    , block : Maybe (List ( Modifiers BlockDetails, StyleSelector ))
    }


{-| -}
type alias InputFileAttributes msg =
    { name : Maybe String
    , type_ : String
    , universal : UniversalAttributes
    , box : List ( Modifiers Box.Box, StyleSelector )
    , onMouseEvents : Maybe (OnMouseEventsInside msg)
    , onEvent : Maybe ( String, Decoder msg )
    , onBlurEvent : Maybe msg
    , onFocusEvent : Maybe msg
    , label : Maybe (Shared.Label msg)
    , rawStyle : Maybe Elegant.Style
    , block : Maybe (List ( Modifiers BlockDetails, StyleSelector ))
    }


{-| -}
label : Position -> List (Html msg) -> { c | label : Maybe (Shared.Label msg) } -> { c | label : Maybe (Shared.Label msg) }
label position content record =
    { record
        | label =
            Just <|
                Shared.label <|
                    \input ->
                        Html.label [] <|
                            case position of
                                Before ->
                                    content ++ [ input ]

                                After ->
                                    input :: content
    }


{-| -}
value : a -> { c | value : Maybe a } -> { c | value : Maybe a }
value =
    setValue


setUniversal :
    UniversalAttributes
    -> { a | universal : UniversalAttributes }
    -> { a | universal : UniversalAttributes }
setUniversal val attrs =
    { attrs | universal = val }


setUniversalIn :
    { a | universal : UniversalAttributes }
    -> UniversalAttributes
    -> { a | universal : UniversalAttributes }
setUniversalIn =
    flip setUniversal


setValueInUniversal :
    (a -> UniversalAttributes -> UniversalAttributes)
    -> a
    -> { c | universal : UniversalAttributes }
    -> { c | universal : UniversalAttributes }
setValueInUniversal setter val ({ universal } as attrs) =
    universal
        |> setter val
        |> setUniversalIn attrs


{-| -}
title : String -> Modifier { a | universal : UniversalAttributes }
title =
    setValueInUniversal setTitle


{-| -}
id : String -> Modifier { a | universal : UniversalAttributes }
id =
    setValueInUniversal setId


{-| -}
class : List String -> Modifier { a | universal : UniversalAttributes }
class =
    setValueInUniversal setClass


{-| -}
tabindex : Int -> Modifier { a | universal : UniversalAttributes }
tabindex =
    setValueInUniversal setTabIndex


{-| -}
defaultUniversalAttributes : UniversalAttributes
defaultUniversalAttributes =
    { class = []
    , id = Nothing
    , tabindex = Nothing
    , title = Nothing
    }


{-| -}
universalAttributesToHtmlAttributes : UniversalAttributes -> List (Html.Attribute msg)
universalAttributesToHtmlAttributes universal =
    [ .class >> List.map Html.Attributes.class
    , .id >> unwrapMaybeAttribute Html.Attributes.id
    , .tabindex >> unwrapMaybeAttribute Html.Attributes.tabindex
    , .title >> unwrapMaybeAttribute Html.Attributes.title
    ]
        |> List.concatMap (callOn universal)


{-| -}
defaultFlowAttributes : FlowAttributes msg
defaultFlowAttributes =
    { onBlurEvent = Nothing
    , onEvent = Nothing
    , onFocusEvent = Nothing
    , onMouseEvents = Nothing
    , box = []
    , universal = defaultUniversalAttributes
    , rawStyle = Nothing
    }


{-| -}
visibleAttributesToHtmlAttributes : VisibleAttributesAndEvents msg a -> List (Html.Attribute msg)
visibleAttributesToHtmlAttributes visibleAttributes =
    [ unwrapEmptyList mouseEventsToHtmlAttributes << .onMouseEvents
    , unwrapEmptyList focusEventToHtmlAttributes << .onFocusEvent
    , unwrapEmptyList onEventToHtmlAttributes << .onEvent
    , unwrapEmptyList onBlurEventToHtmlAttributes << .onBlurEvent
    , universalAttributesToHtmlAttributes << .universal
    , unwrapEmptyList rawStyleToHtmlAttributes << .rawStyle
    ]
        |> List.concatMap (callOn visibleAttributes)


{-| -}
rawStyleToHtmlAttributes : Elegant.Style -> List (Html.Attribute msg)
rawStyleToHtmlAttributes style =
    [ Html.Attributes.class (Elegant.styleToCss style) ]


{-| -}
flowAttributesToHtmlAttributes : FlowAttributes msg -> List (Html.Attribute msg)
flowAttributesToHtmlAttributes =
    visibleAttributesToHtmlAttributes


{-| -}
defaultNodeAttributes : NodeAttributes msg
defaultNodeAttributes =
    { onBlurEvent = Nothing
    , onEvent = Nothing
    , onFocusEvent = Nothing
    , onMouseEvents = Nothing
    , box = []
    , universal = defaultUniversalAttributes
    , block = Nothing
    , rawStyle = Nothing
    }


{-| -}
defaultFlexContainerAttributes : FlexContainerAttributes msg
defaultFlexContainerAttributes =
    { onBlurEvent = Nothing
    , onEvent = Nothing
    , onFocusEvent = Nothing
    , onMouseEvents = Nothing
    , box = []
    , universal = defaultUniversalAttributes
    , block = Nothing
    , flexContainerProperties = [ ( [], defaultStyleSelector ) ]
    , rawStyle = Nothing
    }


{-| -}
defaultGridContainerAttributes : GridContainerAttributes msg
defaultGridContainerAttributes =
    { onBlurEvent = Nothing
    , onEvent = Nothing
    , onFocusEvent = Nothing
    , onMouseEvents = Nothing
    , box = []
    , universal = defaultUniversalAttributes
    , block = Nothing
    , gridContainerProperties = [ ( [], defaultStyleSelector ) ]
    , rawStyle = Nothing
    }


{-| -}
defaultHeadingAttributes : HeadingAttributes msg
defaultHeadingAttributes =
    { onBlurEvent = Nothing
    , onEvent = Nothing
    , onFocusEvent = Nothing
    , onMouseEvents = Nothing
    , box = []
    , universal = defaultUniversalAttributes
    , block = [ ( [], defaultStyleSelector ) ]
    , rawStyle = Nothing
    }


{-| -}
defaultFlexItemAttributes : FlexItemAttributes msg
defaultFlexItemAttributes =
    { onBlurEvent = Nothing
    , onEvent = Nothing
    , onFocusEvent = Nothing
    , onMouseEvents = Nothing
    , box = []
    , block = Nothing
    , universal = defaultUniversalAttributes
    , flexItemProperties = []
    , rawStyle = Nothing
    }


{-| -}
defaultGridItemAttributes : GridItemAttributes msg
defaultGridItemAttributes =
    { onBlurEvent = Nothing
    , onEvent = Nothing
    , onFocusEvent = Nothing
    , onMouseEvents = Nothing
    , box = []
    , block = Nothing
    , universal = defaultUniversalAttributes
    , gridItemProperties = []
    , rawStyle = Nothing
    }


{-| -}
nodeAttributesToHtmlAttributes : NodeAttributes msg -> List (Html.Attribute msg)
nodeAttributesToHtmlAttributes =
    visibleAttributesToHtmlAttributes


{-| -}
flexContainerAttributesToHtmlAttributes : FlexContainerAttributes msg -> List (Html.Attribute msg)
flexContainerAttributesToHtmlAttributes =
    visibleAttributesToHtmlAttributes


{-| -}
flexItemAttributesToHtmlAttributes : FlexItemAttributes msg -> List (Html.Attribute msg)
flexItemAttributesToHtmlAttributes =
    visibleAttributesToHtmlAttributes


{-| -}
gridContainerAttributesToHtmlAttributes : GridContainerAttributes msg -> List (Html.Attribute msg)
gridContainerAttributesToHtmlAttributes =
    visibleAttributesToHtmlAttributes


{-| -}
gridItemAttributesToHtmlAttributes : GridItemAttributes msg -> List (Html.Attribute msg)
gridItemAttributesToHtmlAttributes =
    visibleAttributesToHtmlAttributes


{-| -}
headingAttributesToHtmlAttributes : HeadingAttributes msg -> List (Html.Attribute msg)
headingAttributesToHtmlAttributes =
    visibleAttributesToHtmlAttributes


{-| -}
disabled : Modifier (DisabledAttribute a)
disabled =
    setDisabled True


{-| -}
disabledAttributeToHtmlAttributes : Bool -> List (Html.Attribute msg)
disabledAttributeToHtmlAttributes =
    Html.Attributes.disabled >> List.singleton


{-| -}
defaultButtonAttributes : ButtonAttributes msg
defaultButtonAttributes =
    { disabled = False
    , onBlurEvent = Nothing
    , onEvent = Nothing
    , onFocusEvent = Nothing
    , onMouseEvents = Nothing
    , box = []
    , block = Nothing
    , universal = defaultUniversalAttributes
    , rawStyle = Nothing
    }


{-| -}
buttonAttributesToHtmlAttributes : ButtonAttributes msg -> List (Html.Attribute msg)
buttonAttributesToHtmlAttributes buttonAttributes =
    buttonAttributes.disabled
        |> disabledAttributeToHtmlAttributes
        |> List.append
            (visibleAttributesToHtmlAttributes buttonAttributes)


{-| -}
target : String -> Modifier (TargetAttribute a)
target =
    setTarget


{-| -}
href : String -> Modifier (HrefAttribute a)
href =
    setHref


{-| -}
defaultAAttributes : AAttributes msg
defaultAAttributes =
    { href = Nothing
    , target = Nothing
    , box = []
    , block = Nothing
    , universal = defaultUniversalAttributes
    , onMouseEvents = Nothing
    , onEvent = Nothing
    , onBlurEvent = Nothing
    , onFocusEvent = Nothing
    , rawStyle = Nothing
    }


{-| -}
aAttributesToHtmlAttributes : AAttributes msg -> List (Html.Attribute msg)
aAttributesToHtmlAttributes attributes =
    [ unwrapMaybeAttribute Html.Attributes.href << .href
    , unwrapMaybeAttribute Html.Attributes.target << .target
    ]
        |> List.concatMap (callOn attributes)
        |> List.append (visibleAttributesToHtmlAttributes attributes)


{-| -}
name : String -> Modifier (NameAttribute a)
name =
    setName


{-| -}
defaultTextareaAttributes : TextareaAttributes msg
defaultTextareaAttributes =
    { value = Nothing
    , name = Nothing
    , universal = defaultUniversalAttributes
    , box = []
    , block = Nothing
    , onMouseEvents = Nothing
    , onInputEvent = Nothing
    , fromStringInput = identity
    , onEvent = Nothing
    , onBlurEvent = Nothing
    , onFocusEvent = Nothing
    , rawStyle = Nothing
    }


{-| -}
textareaAttributesToHtmlAttributes : TextareaAttributes msg -> List (Html.Attribute msg)
textareaAttributesToHtmlAttributes attributes =
    [ unwrapMaybeAttribute Html.Attributes.value << .value
    , unwrapMaybeAttribute Html.Attributes.name << .name
    ]
        |> List.concatMap (callOn attributes)
        |> List.append (inputEventToHtmlEvent ( attributes.onInputEvent, attributes.fromStringInput ))
        |> List.append (visibleAttributesToHtmlAttributes attributes)


{-| -}
width : Int -> Modifier (WidthAttribute a)
width =
    setWidth


{-| -}
height : Int -> Modifier (HeightAttribute a)
height =
    setHeight


{-| -}
defaultImgAttributes : String -> String -> ImgAttributes msg
defaultImgAttributes alt src =
    { src = src
    , alt = alt
    , universal = defaultUniversalAttributes
    , box = []
    , block = Nothing
    , onMouseEvents = Nothing
    , width = Nothing
    , height = Nothing
    , onEvent = Nothing
    , onBlurEvent = Nothing
    , onFocusEvent = Nothing
    , rawStyle = Nothing
    }


{-| -}
imgAttributesToHtmlAttributes : ImgAttributes msg -> List (Html.Attribute msg)
imgAttributesToHtmlAttributes attributes =
    [ unwrapMaybeAttribute Html.Attributes.height << .height
    , unwrapMaybeAttribute Html.Attributes.width << .width
    ]
        |> List.concatMap (callOn attributes)
        |> List.append
            ([ Html.Attributes.alt << .alt
             , Html.Attributes.src << .src
             ]
                |> List.map (callOn attributes)
            )
        |> List.append (visibleAttributesToHtmlAttributes attributes)


{-| -}
defaultAudioAttributes : AudioAttributes msg
defaultAudioAttributes =
    { universal = defaultUniversalAttributes
    , box = []
    , block = Nothing
    , onMouseEvents = Nothing
    , src = ""
    , onEvent = Nothing
    , onBlurEvent = Nothing
    , onFocusEvent = Nothing
    , rawStyle = Nothing
    }


{-| -}
audioAttributesToHtmlAttributes : AudioAttributes msg -> List (Html.Attribute msg)
audioAttributesToHtmlAttributes attributes =
    Html.Attributes.src attributes.src :: visibleAttributesToHtmlAttributes attributes


{-| -}
defaultProgressAttributes : ProgressAttributes msg
defaultProgressAttributes =
    { universal = defaultUniversalAttributes
    , box = []
    , block = Nothing
    , onMouseEvents = Nothing
    , onEvent = Nothing
    , onBlurEvent = Nothing
    , onFocusEvent = Nothing
    , rawStyle = Nothing
    }


{-| -}
progressAttributesToHtmlAttributes : ProgressAttributes msg -> List (Html.Attribute msg)
progressAttributesToHtmlAttributes =
    visibleAttributesToHtmlAttributes


{-| -}
data : a -> { c | data : b } -> { c | data : a }
data val attrs =
    { attrs | data = val }


{-| -}
defaultScriptAttributes : ScriptAttributes msg
defaultScriptAttributes =
    { universal = defaultUniversalAttributes
    , src = ""
    , box = []
    , onMouseEvents = Nothing
    , onEvent = Nothing
    , onBlurEvent = Nothing
    , onFocusEvent = Nothing
    , data = []
    , rawStyle = Nothing
    }


{-| -}
scriptAttributesToHtmlAttributes : ScriptAttributes msg -> List (Html.Attribute msg)
scriptAttributesToHtmlAttributes attributes =
    -- TODO data handler
    Html.Attributes.src attributes.src :: visibleAttributesToHtmlAttributes attributes


{-| -}
inputAttributesToHtmlAttributes : InputAttributes a -> List (Html.Attribute msg)
inputAttributesToHtmlAttributes attributes =
    Html.Attributes.type_ attributes.type_ :: unwrapMaybeAttribute Html.Attributes.name attributes.name


{-| -}
defaultInputHiddenAttributes : InputHiddenAttributes
defaultInputHiddenAttributes =
    { name = Nothing
    , universal = defaultUniversalAttributes
    , type_ = "hidden"
    , value = Nothing
    }


{-| -}
inputHiddenAttributesToHtmlAttributes : InputHiddenAttributes -> List (Html.Attribute msg)
inputHiddenAttributesToHtmlAttributes attributes =
    unwrapMaybeAttribute Html.Attributes.value attributes.value
        |> List.append (inputAttributesToHtmlAttributes attributes)
        |> List.append (universalAttributesToHtmlAttributes attributes.universal)


{-| -}
inputVisibleToHtmlAttributes :
    VisibleAttributesAndEvents msg { a | name : Maybe String, type_ : String }
    -> List (Html.Attribute msg)
inputVisibleToHtmlAttributes attributes =
    List.append
        (visibleAttributesToHtmlAttributes attributes)
        (inputAttributesToHtmlAttributes attributes)


{-| -}
autocomplete : Bool -> Modifier (AutocompleteAttribute a)
autocomplete =
    setAutocomplete


{-| -}
placeholder : String -> Modifier (PlaceholderAttribute a)
placeholder =
    setPlaceholder


{-| -}
defaultInputTextAttributes : InputTextAttributes msg
defaultInputTextAttributes =
    { universal = defaultUniversalAttributes
    , box = []
    , block = Nothing
    , label = Nothing
    , name = Nothing
    , type_ = "text"
    , value = Nothing
    , onMouseEvents = Nothing
    , onInputEvent = Nothing
    , fromStringInput = identity
    , onEvent = Nothing
    , onBlurEvent = Nothing
    , onFocusEvent = Nothing
    , placeholder = Nothing
    , autocomplete = True
    , rawStyle = Nothing
    }


{-| -}
inputTextAttributesToHtmlAttributes : InputTextAttributes msg -> List (Html.Attribute msg)
inputTextAttributesToHtmlAttributes attributes =
    Html.Attributes.autocomplete attributes.autocomplete
        :: ([ unwrapMaybeAttribute Html.Attributes.placeholder << .placeholder
            , unwrapMaybeAttribute Html.Attributes.value << .value
            ]
                |> List.concatMap (callOn attributes)
                |> List.append (inputVisibleToHtmlAttributes attributes)
                |> List.append (inputEventToHtmlEvent ( attributes.onInputEvent, attributes.fromStringInput ))
           )


{-| -}
defaultInputTelAttributes : InputTelAttributes msg
defaultInputTelAttributes =
    { universal = defaultUniversalAttributes
    , box = []
    , block = Nothing
    , label = Nothing
    , name = Nothing
    , type_ = "tel"
    , value = Nothing
    , onMouseEvents = Nothing
    , onInputEvent = Nothing
    , fromStringInput = identity
    , onEvent = Nothing
    , onBlurEvent = Nothing
    , onFocusEvent = Nothing
    , placeholder = Nothing
    , autocomplete = True
    , rawStyle = Nothing
    }



-- From HERE


{-| -}
step : Int -> Modifier (StepAttribute a)
step =
    setStep


{-| -}
max : Int -> Modifier (MaxAttribute a)
max =
    setMax


{-| -}
min : Int -> Modifier (MinAttribute a)
min =
    setMin


{-| -}
defaultInputNumberAttributes : InputNumberAttributes msg
defaultInputNumberAttributes =
    { universal = defaultUniversalAttributes
    , box = []
    , label = Nothing
    , name = Nothing
    , type_ = "number"
    , value = Nothing
    , onMouseEvents = Nothing
    , onInputEvent = Nothing
    , fromStringInput = parseInt
    , onEvent = Nothing
    , onBlurEvent = Nothing
    , onFocusEvent = Nothing
    , min = Nothing
    , max = Nothing
    , step = Nothing
    , block = Nothing
    , rawStyle = Nothing
    , disabled = False
    }


{-| -}
inputNumberAttributesToHtmlAttributes : InputNumberAttributes msg -> List (Html.Attribute msg)
inputNumberAttributesToHtmlAttributes attributes =
    [ unwrapMaybeAttribute Html.Attributes.value << (Maybe.map toString << .value)
    , unwrapMaybeAttribute Html.Attributes.min << (Maybe.map toString << .min)
    , unwrapMaybeAttribute Html.Attributes.max << (Maybe.map toString << .max)
    ]
        |> List.concatMap (callOn attributes)
        |> List.append [ Html.Attributes.disabled attributes.disabled ]
        |> List.append (inputVisibleToHtmlAttributes attributes)
        |> List.append (inputEventToHtmlEvent ( attributes.onInputEvent, attributes.fromStringInput ))


{-| -}
defaultInputColorAttributes : InputColorAttributes msg
defaultInputColorAttributes =
    { universal = defaultUniversalAttributes
    , box = []
    , label = Nothing
    , block = Nothing
    , name = Nothing
    , type_ = "color"
    , value = Nothing
    , onMouseEvents = Nothing
    , onInputEvent = Nothing
    , fromStringInput = parseColor
    , onEvent = Nothing
    , onBlurEvent = Nothing
    , onFocusEvent = Nothing
    , rawStyle = Nothing
    }


{-| -}
inputColorAttributesToHtmlAttributes : InputColorAttributes msg -> List (Html.Attribute msg)
inputColorAttributesToHtmlAttributes attributes =
    unwrapMaybeAttribute Html.Attributes.value (Maybe.map Color.Convert.colorToHex <| attributes.value)
        |> List.append (inputVisibleToHtmlAttributes attributes)
        |> List.append (inputEventToHtmlEvent ( attributes.onInputEvent, attributes.fromStringInput ))


{-| -}
checked : Bool -> Modifier (InputCheckboxAttributes msg)
checked =
    setChecked


{-| -}
defaultInputCheckboxAttributes : InputCheckboxAttributes msg
defaultInputCheckboxAttributes =
    { name = Nothing
    , label = Nothing
    , type_ = "checkbox"
    , value = Nothing
    , checked = False
    , universal = defaultUniversalAttributes
    , box = []
    , block = Nothing
    , onMouseEvents = Nothing
    , onCheckEvent = Nothing
    , onEvent = Nothing
    , onBlurEvent = Nothing
    , onFocusEvent = Nothing
    , rawStyle = Nothing
    }


{-| -}
inputCheckboxAttributesToHtmlAttributes : InputCheckboxAttributes msg -> List (Html.Attribute msg)
inputCheckboxAttributesToHtmlAttributes attributes =
    Html.Attributes.checked attributes.checked
        |> flip (::) (unwrapMaybeAttribute Html.Attributes.value (Maybe.map toString <| attributes.value))
        |> List.append (inputVisibleToHtmlAttributes attributes)
        |> List.append (checkEventToHtmlEvent attributes)


{-| -}
defaultInputFileAttributes : InputFileAttributes msg
defaultInputFileAttributes =
    { name = Nothing
    , label = Nothing
    , type_ = "file"
    , universal = defaultUniversalAttributes
    , box = []
    , block = Nothing
    , onMouseEvents = Nothing
    , onEvent = Nothing
    , onBlurEvent = Nothing
    , onFocusEvent = Nothing
    , rawStyle = Nothing
    }


{-| -}
inputFileAttributesToHtmlAttributes : InputFileAttributes msg -> List (Html.Attribute msg)
inputFileAttributesToHtmlAttributes =
    inputVisibleToHtmlAttributes


{-| -}
defaultInputPasswordAttributes : InputPasswordAttributes msg
defaultInputPasswordAttributes =
    { name = Nothing
    , label = Nothing
    , type_ = "password"
    , value = Nothing
    , universal = defaultUniversalAttributes
    , box = []
    , block = Nothing
    , onMouseEvents = Nothing
    , onInputEvent = Nothing
    , fromStringInput = identity
    , onEvent = Nothing
    , onBlurEvent = Nothing
    , onFocusEvent = Nothing
    , placeholder = Nothing
    , autocomplete = True
    , rawStyle = Nothing
    }


{-| -}
inputPasswordAttributesToHtmlAttributes : InputPasswordAttributes msg -> List (Html.Attribute msg)
inputPasswordAttributesToHtmlAttributes =
    inputTextAttributesToHtmlAttributes


{-| -}
defaultInputRadioAttributes : InputRadioAttributes msg
defaultInputRadioAttributes =
    { name = Nothing
    , label = Nothing
    , type_ = "radio"
    , value = Nothing
    , universal = defaultUniversalAttributes
    , box = []
    , onMouseEvents = Nothing
    , onEvent = Nothing
    , onBlurEvent = Nothing
    , onFocusEvent = Nothing
    , block = Nothing
    , rawStyle = Nothing
    }


{-| -}
inputRadioAttributesToHtmlAttributes : InputRadioAttributes msg -> List (Html.Attribute msg)
inputRadioAttributesToHtmlAttributes attributes =
    List.append
        (unwrapMaybeAttribute Html.Attributes.value attributes.value)
        (inputVisibleToHtmlAttributes attributes)


{-| -}
defaultInputRangeAttributes : InputRangeAttributes msg
defaultInputRangeAttributes =
    { universal = defaultUniversalAttributes
    , label = Nothing
    , box = []
    , name = Nothing
    , type_ = "range"
    , value = Nothing
    , onMouseEvents = Nothing
    , onInputEvent = Nothing
    , fromStringInput = parseInt
    , onEvent = Nothing
    , onBlurEvent = Nothing
    , onFocusEvent = Nothing
    , min = Nothing
    , max = Nothing
    , step = Nothing
    , block = Nothing
    , rawStyle = Nothing
    , disabled = False
    }


{-| -}
inputRangeAttributesToHtmlAttributes : InputRangeAttributes msg -> List (Html.Attribute msg)
inputRangeAttributesToHtmlAttributes =
    inputNumberAttributesToHtmlAttributes


{-| -}
defaultInputSubmitAttributes : InputSubmitAttributes msg
defaultInputSubmitAttributes =
    { type_ = "submit"
    , label = Nothing
    , universal = defaultUniversalAttributes
    , box = []
    , block = Nothing
    , onMouseEvents = Nothing
    , disabled = False
    , onSubmitEvent = Nothing
    , onEvent = Nothing
    , onBlurEvent = Nothing
    , onFocusEvent = Nothing
    , rawStyle = Nothing
    }


{-| -}
inputSubmitAttributesToHtmlAttributes : InputSubmitAttributes msg -> List (Html.Attribute msg)
inputSubmitAttributesToHtmlAttributes attributes =
    List.concat
        [ submitEventToHtmlEvent attributes
        , Html.Attributes.disabled attributes.disabled
            :: Html.Attributes.type_ attributes.type_
            :: visibleAttributesToHtmlAttributes attributes
        ]


{-| -}
defaultInputUrlAttributes : InputUrlAttributes msg
defaultInputUrlAttributes =
    { name = Nothing
    , label = Nothing
    , value = Nothing
    , type_ = "url"
    , universal = defaultUniversalAttributes
    , box = []
    , block = Nothing
    , onMouseEvents = Nothing
    , onInputEvent = Nothing
    , fromStringInput = identity
    , onEvent = Nothing
    , onBlurEvent = Nothing
    , onFocusEvent = Nothing
    , placeholder = Nothing
    , autocomplete = True
    , rawStyle = Nothing
    }


{-| -}
inputUrlAttributesToHtmlAttributes : InputUrlAttributes msg -> List (Html.Attribute msg)
inputUrlAttributesToHtmlAttributes =
    inputTextAttributesToHtmlAttributes


{-| -}
defaultSelectAttributes : SelectAttributes msg
defaultSelectAttributes =
    { value = Nothing
    , universal = defaultUniversalAttributes
    , box = []
    , block = Nothing
    , onMouseEvents = Nothing
    , onEvent = Nothing
    , onBlurEvent = Nothing
    , onFocusEvent = Nothing
    , onInputEvent = Nothing
    , fromStringInput = identity
    , rawStyle = Nothing
    }


{-| -}
selectAttributesToHtmlAttributes : SelectAttributes msg -> List (Html.Attribute msg)
selectAttributesToHtmlAttributes attributes =
    unwrapMaybeAttribute Html.Attributes.value attributes.value
        |> List.append (visibleAttributesToHtmlAttributes attributes)
        |> List.append (inputEventToHtmlEvent ( attributes.onInputEvent, attributes.fromStringInput ))
