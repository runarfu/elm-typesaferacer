module Views exposing (view)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import String
import Types exposing (..)


view : Model -> Html Msg
view model =
    div [ centerStyle ]
        [ h1 [] [ text "Typesafe Racer" ]
        , progress model
        , textField model
        , p [] [ text (toString model) ]
        ]


progress : Model -> Html Msg
progress model =
    let
        render words color =
            span [ style [ ( "color", color ) ] ]
                [ words
                    |> String.join " "
                    |> text
                ]
    in
        p []
            [ render model.history "green"
            , span [] [ text " " ]
            , render model.wordsToWrite "black"
            ]


textField : Model -> Html Msg
textField model =
    div []
        [ textarea
            [ autofocus True
            , onInput Input
            , value model.input
            ]
            []
        ]


centerStyle =
    style [ ( "text-align", "center" ) ]
