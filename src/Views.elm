module Views exposing (view)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import String
import Types exposing (..)
import Time


view : Model -> Html Msg
view model =
    div [ style [ ( "text-align", "center" ) ] ]
        [ h1 [] [ text "Typesafe Racer" ]
        , p [] [ highlightCorrectPart model.sentence model.input ]
        , p [] [ textField model ]
        , p [] [ text <| "Current time: " ++ (toString model.time) ]
        , p [] [ text <| viewTime model ]
        ]


viewTime : Model -> String
viewTime model =
    let
        timeSpent =
            model.time - model.startTime
    in
        [ Time.inHours
        , Time.inMinutes
        , Time.inSeconds
        ]
            |> List.map (\f -> round (f timeSpent))
            |> List.map toString
            |> List.map (String.padLeft 2 '0')
            |> List.intersperse ":"
            |> String.concat


renderTime : Time.Time -> String
renderTime time =
    (toString <| Time.inHours time)


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
    textarea [ autofocus True, onInput Input ] [ text model.input ]
