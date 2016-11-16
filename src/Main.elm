module Main exposing (..)

import Html.App as Html
import State exposing (..)
import Types exposing (..)
import Views exposing (..)


main : Program Never
main =
    Html.program
        { init = ( "", Cmd.none )
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }
