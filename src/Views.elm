module Views exposing (view)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import String
import Types exposing (..)


view : Model -> Html Msg
view model =
    div [ style [ ( "text-align", "center" ) ] ]
        [ h1 [] [ text "Typesafe Racer" ]
        , p [] [ highlightCorrectPart model.sentence ( model.finished ++model.input ) ]
        , p [] [ textField model ]
        ]


highlightCorrectPart : String -> String -> Html Msg
highlightCorrectPart correctString attempt =
    if String.startsWith attempt correctString then
        let
            length =
                String.length attempt

            correctPart =
                String.left length correctString

            wrongPart =
                String.dropLeft length correctString
        in
            span []
                [ span [ style [ ( "color", "green" ), ( "background-color", "black" ) ] ] [ text correctPart ]
                , span [] [ text wrongPart ]
                ]
    else
        div [] [ text correctString ]


textField : Model -> Html Msg
textField model =
    textarea [ autofocus True, onInput Input, value model.input] [  ]
