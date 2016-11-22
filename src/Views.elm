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
        , p [] [ highlightCorrectPart model.sentence model.finished model.input ]
        , p [] [ textField model ]
        , p [] [ winMessage model ]
        ]


highlightCorrectPart : List String -> Int -> String -> Html Msg
highlightCorrectPart sentence finished input =
    let
        correctWords =
            List.take finished sentence

        remainingWords =
            List.drop finished sentence

        currentWord =
            List.head remainingWords |> Maybe.withDefault ""
    in
        span []
            [ span [ style [ ( "color", "green" ), ( "background-color", "mediumgray" ) ] ] [ String.join " " correctWords ++ " " |> text ]
            , span [ style [ ( "background-color", "lightgray" ) ] ] [ text currentWord ]
            , span [] [ List.tail remainingWords |> Maybe.withDefault [] |> List.append [ " " ] |> String.join " " |> text ]
            ]


textField : Model -> Html Msg
textField model =
    textarea [ autofocus True, onInput Input, value model.input ] []


winMessage : Model -> Html Msg
winMessage model =
    if model.finished == List.length model.sentence then
        text "You're winner!"
    else
        text ""
