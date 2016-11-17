module Main exposing (..)

import Html as Html
import State exposing (..)
import Types exposing (..)
import Views exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = ( initModel, Cmd.none )
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }


initModel : Model
initModel =
    { sentence = "Elm sure is fun (and typesafe)!"
    , input = ""
    , finished = ""
    }
