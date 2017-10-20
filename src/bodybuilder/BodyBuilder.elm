module BodyBuilder exposing (..)

import Html exposing (Html)
import Html.Attributes
import Elegant
import BodyBuilder.Attributes exposing (..)
import Function
import Helpers.Shared exposing (..)
import Display exposing (FlexContainerDetails)


-- import Native.BodyBuilder
-- import Native.Elegant
-- import List.Extra

import Display


type alias Node msg =
    Html msg



-- div : Modifiers (FlowAttributes msg) -> List (Node msg) -> Node msg
-- div =
--     flow "div"
--
--
-- br : Modifiers (FlowAttributes msg) -> Node msg
-- br =
--     flip (flow "br") []
--
--
-- h1 : Modifiers (FlowAttributes msg) -> List (Node msg) -> Node msg
-- h1 =
--     flow "h1"
--
--
-- h2 : Modifiers (FlowAttributes msg) -> List (Node msg) -> Node msg
-- h2 =
--     flow "h2"
--
--
-- h3 : Modifiers (FlowAttributes msg) -> List (Node msg) -> Node msg
-- h3 =
--     flow "h3"
--
--
-- h4 : Modifiers (FlowAttributes msg) -> List (Node msg) -> Node msg
-- h4 =
--     flow "h4"
--
--
-- h5 : Modifiers (FlowAttributes msg) -> List (Node msg) -> Node msg
-- h5 =
--     flow "h5"
--
--
-- h6 : Modifiers (FlowAttributes msg) -> List (Node msg) -> Node msg
-- h6 =
--     flow "h6"
--
--
-- button : Modifiers (ButtonAttributes msg) -> List (Node msg) -> Node msg
-- button =
--     visibleNode
--         BodyBuilder.Attributes.defaultButtonAttributes
--         BodyBuilder.Attributes.buttonAttributesToHtmlAttributes
--         "button"
--
--
-- {-| -}
-- a : Modifiers (AAttributes msg) -> List (Node msg) -> Node msg
-- a =
--     visibleNode
--         BodyBuilder.Attributes.defaultAAttributes
--         BodyBuilder.Attributes.aAttributesToHtmlAttributes
--         "a"
--
--
-- {-| -}
-- ul : Modifiers (FlowAttributes msg) -> List (Node msg) -> Node msg
-- ul =
--     flow "ul"
--
--
-- {-| -}
-- ol : Modifiers (FlowAttributes msg) -> List (Node msg) -> Node msg
-- ol =
--     flow "ol"
--
--
-- {-| -}
-- li : Modifiers (FlowAttributes msg) -> List (Node msg) -> Node msg
-- li =
--     flow "li"
--
--
-- {-| -}
-- p : Modifiers (FlowAttributes msg) -> List (Node msg) -> Node msg
-- p =
--     flow "p"
--
--
-- {-| -}
-- span : Modifiers (FlowAttributes msg) -> List (Node msg) -> Node msg
-- span =
--     flow "span"
--
--
-- {-| -}
-- textarea : Modifiers (TextareaAttributes msg) -> Node msg
-- textarea =
--     flip
--         (visibleNode
--             BodyBuilder.Attributes.defaultTextareaAttributes
--             BodyBuilder.Attributes.textareaAttributesToHtmlAttributes
--             "textarea"
--         )
--         []
--
--
-- {-| -}
-- img : String -> String -> Modifiers (ImgAttributes msg) -> Node msg
-- img alt src =
--     flip
--         (visibleNode
--             (BodyBuilder.Attributes.defaultImgAttributes alt src)
--             BodyBuilder.Attributes.imgAttributesToHtmlAttributes
--             "img"
--         )
--         []
--
--
-- {-| -}
-- audio : Modifiers (AudioAttributes msg) -> Node msg
-- audio =
--     flip
--         (visibleNode
--             BodyBuilder.Attributes.defaultAudioAttributes
--             BodyBuilder.Attributes.audioAttributesToHtmlAttributes
--             "audio"
--         )
--         []
--
--
-- {-| -}
-- progress : Modifiers (ProgressAttributes msg) -> Node msg
-- progress =
--     flip
--         (visibleNode
--             BodyBuilder.Attributes.defaultProgressAttributes
--             BodyBuilder.Attributes.progressAttributesToHtmlAttributes
--             "progress"
--         )
--         []
--
--
-- {-| TODO
-- -}
-- table : List (Node msg) -> List (List (Node msg)) -> Node msg
-- table children table =
--     visibleNode BodyBuilder.Attributes.defaultFlowAttributes (\_ -> []) "table" [] []
--
--
-- {-| -}
-- node : String -> Modifiers (FlowAttributes msg) -> List (Node msg) -> Node msg
-- node =
--     flow
--
--
-- {-| -}
-- leaf : Modifiers (FlowAttributes msg) -> Node msg
-- leaf =
--     flip div []
--
--
-- {-| -}
-- container : List (Node msg) -> Node msg
-- container =
--     div []
--
--
-- {-| TODO
-- -}
-- mapLis : List (Node msg) -> List (Node msg)
-- mapLis =
--     List.map (\content -> li [] [ content ])
--
--
-- {-| TODO
-- -}
-- olLi : Modifiers (FlowAttributes msg) -> List (Node msg) -> Node msg
-- olLi attributes insideLis =
--     ol attributes (mapLis insideLis)
--
--
-- {-| TODO
-- -}
-- ulLi : Modifiers (FlowAttributes msg) -> List (Node msg) -> Node msg
-- ulLi attributes insideLis =
--     ul attributes (mapLis insideLis)
--
--
-- {-| -}
-- script : Modifiers (ScriptAttributes msg) -> Node msg
-- script =
--     flip
--         (visibleNode
--             BodyBuilder.Attributes.defaultScriptAttributes
--             BodyBuilder.Attributes.scriptAttributesToHtmlAttributes
--             "script"
--         )
--         []
--
--
-- {-| -}
-- inputHidden : Modifiers InputHiddenAttributes -> Node msg
-- inputHidden =
--     hiddenNode
--         BodyBuilder.Attributes.defaultInputHiddenAttributes
--         BodyBuilder.Attributes.inputHiddenAttributesToHtmlAttributes
--         "input"
--
--
-- {-| -}
-- inputText : Modifiers (InputTextAttributes msg) -> Node msg
-- inputText =
--     flip
--         (visibleNode
--             BodyBuilder.Attributes.defaultInputTextAttributes
--             BodyBuilder.Attributes.inputTextAttributesToHtmlAttributes
--             "input"
--         )
--         []
--
--
-- {-| -}
-- inputNumber : Modifiers (InputNumberAttributes msg) -> Node msg
-- inputNumber =
--     flip
--         (visibleNode
--             BodyBuilder.Attributes.defaultInputNumberAttributes
--             BodyBuilder.Attributes.inputNumberAttributesToHtmlAttributes
--             "input"
--         )
--         []
--
--
-- {-| -}
-- inputColor : Modifiers (InputColorAttributes msg) -> Node msg
-- inputColor =
--     flip
--         (visibleNode
--             BodyBuilder.Attributes.defaultInputColorAttributes
--             BodyBuilder.Attributes.inputColorAttributesToHtmlAttributes
--             "input"
--         )
--         []
--
--
-- {-| -}
-- inputCheckbox : Modifiers (InputCheckboxAttributes msg) -> Node msg
-- inputCheckbox =
--     flip
--         (visibleNode
--             BodyBuilder.Attributes.defaultInputCheckboxAttributes
--             BodyBuilder.Attributes.inputCheckboxAttributesToHtmlAttributes
--             "input"
--         )
--         []
--
--
-- {-| -}
-- inputFile : Modifiers (InputFileAttributes msg) -> Node msg
-- inputFile =
--     flip
--         (visibleNode
--             BodyBuilder.Attributes.defaultInputFileAttributes
--             BodyBuilder.Attributes.inputFileAttributesToHtmlAttributes
--             "input"
--         )
--         []
--
--
-- {-| -}
-- inputPassword : Modifiers (InputPasswordAttributes msg) -> Node msg
-- inputPassword =
--     flip
--         (visibleNode
--             BodyBuilder.Attributes.defaultInputPasswordAttributes
--             BodyBuilder.Attributes.inputPasswordAttributesToHtmlAttributes
--             "input"
--         )
--         []
--
--
-- {-| -}
-- inputRadio : Modifiers (InputRadioAttributes msg) -> Node msg
-- inputRadio =
--     flip
--         (visibleNode
--             BodyBuilder.Attributes.defaultInputRadioAttributes
--             BodyBuilder.Attributes.inputRadioAttributesToHtmlAttributes
--             "input"
--         )
--         []
--
--
-- {-| -}
-- inputRange : Modifiers (InputRangeAttributes msg) -> Node msg
-- inputRange =
--     flip
--         (visibleNode
--             BodyBuilder.Attributes.defaultInputRangeAttributes
--             BodyBuilder.Attributes.inputRangeAttributesToHtmlAttributes
--             "input"
--         )
--         []
--
--
-- {-| -}
-- inputSubmit : Modifiers (InputSubmitAttributes msg) -> Node msg
-- inputSubmit =
--     flip
--         (visibleNode
--             BodyBuilder.Attributes.defaultInputSubmitAttributes
--             BodyBuilder.Attributes.inputSubmitAttributesToHtmlAttributes
--             "input"
--         )
--         []
--
--
-- {-| -}
-- inputUrl : Modifiers (InputUrlAttributes msg) -> Node msg
-- inputUrl =
--     flip
--         (visibleNode
--             BodyBuilder.Attributes.defaultInputUrlAttributes
--             BodyBuilder.Attributes.inputUrlAttributesToHtmlAttributes
--             "input"
--         )
--         []
--
--
-- {-| -}
-- select : Modifiers (SelectAttributes msg) -> Node msg
-- select =
--     flip
--         (visibleNode
--             BodyBuilder.Attributes.defaultSelectAttributes
--             BodyBuilder.Attributes.selectAttributesToHtmlAttributes
--             "select"
--         )
--         []
--
--
-- text : String -> Node msg
-- text =
--     Html.text


text : String -> Node msg
text =
    Html.text


program :
    { init : ( model, Cmd msg )
    , subscriptions : model -> Sub msg
    , update : msg -> model -> ( model, Cmd msg )
    , view : model -> Html msg
    }
    -> Program Never model msg
program =
    Html.program



-- Internals
-- toVirtualDomClassName : Elegant.Style -> Html.Attribute msg
-- toVirtualDomClassName style =
--     style
--         |> Elegant.styleToCss
--         |> Html.Attributes.class
-- visibleNode :
--     BodyBuilder.Attributes.VisibleAttributes a
--     -> (BodyBuilder.Attributes.VisibleAttributes a -> List (Html.Attribute msg))
--     -> String
--     -> Modifiers (BodyBuilder.Attributes.VisibleAttributes a)
--     -> List (Node msg)
--     -> Node msg
-- visibleNode defaultAttributes attributesToVirtualDomAttributes tag attributesModifiers content =
--     let
--         computedAttributes =
--             Function.compose attributesModifiers <|
--                 defaultAttributes
--     in
--         Html.node tag
--             -- (List.map toVirtualDomClassName computedAttributes.style
--             -- ++ (attributesToVirtualDomAttributes computedAttributes)
--             -- )
--             (attributesToVirtualDomAttributes computedAttributes)
--             content
-- hiddenNode : a -> (a -> List (Html.Attribute msg)) -> String -> List (a -> a) -> Node msg
-- hiddenNode defaultAttributes attributesToVirtualDomAttributes tag attributesModifiers =
--     defaultAttributes
--         |> (Function.compose attributesModifiers)
--         |> attributesToVirtualDomAttributes
--         |> flip (Html.node tag) []
-- flow : String -> Modifiers (FlowAttributes msg) -> List (Node msg) -> Node msg
-- flow =
--     visibleNode
--         BodyBuilder.Attributes.defaultFlowAttributes
--         BodyBuilder.Attributes.flowAttributesToHtmlAttributes


node : Modifiers (NodeAttributes msg) -> List (Node msg) -> Node msg
node =
    computeBlock
        "node"
        Nothing
        BodyBuilder.Attributes.defaultNodeAttributes
        BodyBuilder.Attributes.nodeAttributesToHtmlAttributes


flex : Modifiers FlexContainerDetails -> Modifiers (FlexAttributes msg) -> List (Node msg) -> Node msg
flex modifiers =
    computeBlock
        "flex"
        (Just modifiers)
        BodyBuilder.Attributes.defaultFlexAttributes
        BodyBuilder.Attributes.flexAttributesToHtmlAttributes


computeBlock :
    String
    -> Maybe (Modifiers FlexContainerDetails)
    -> BlockContainer (VisibleAttributes a)
    -> (BlockContainer (VisibleAttributes a) -> List (Html.Attribute msg))
    -> Modifiers (BlockContainer (VisibleAttributes a))
    -> List (Node msg)
    -> Node msg
computeBlock tag flexModifiers defaultAttributes attributesToHtmlAttributes blockModifiers content =
    let
        attributes =
            (Function.compose blockModifiers)
                defaultAttributes
    in
        Html.node tag
            (attributes
                |> displayStyle flexModifiers
                |> Elegant.styleToCss
                |> Html.Attributes.class
                |> flip (::) (attributesToHtmlAttributes attributes)
            )
            content


displayStyle : Maybe (Modifiers FlexContainerDetails) -> BlockContainer (VisibleAttributes a) -> Elegant.Style
displayStyle flexModifiers { block, box } =
    let
        displayInside =
            case flexModifiers of
                Just modifiers ->
                    Display.flexContainer modifiers

                Nothing ->
                    Display.Flow
    in
        Elegant.style <|
            case block of
                Just blockModifiers ->
                    Display.displayBox (Display.block blockModifiers) displayInside box

                Nothing ->
                    Display.displayBox Display.Inline displayInside box
