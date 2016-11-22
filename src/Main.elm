module Main exposing (..)

import Html as Html
import State exposing (..)
import Types exposing (..)
import Views exposing (..)
import Time exposing (Time, second)


main : Program Never Model Msg
main =
    Html.program
        { init = ( initModel, Cmd.none )
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


initModel : Model
initModel =
    { sentence = "Elm sure is fun (and typesafe)!"
    , input = ""
    , startTime = 0
    , time = 0
    , state = NotStarted
    }


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every second Tick
