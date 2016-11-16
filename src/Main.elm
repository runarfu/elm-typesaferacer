module Main exposing (..)

import Html as Html
import State exposing (..)
import Types exposing (..)
import Views exposing (..)


main : Program Never String Msg
main =
    Html.program
        { init = ( "", Cmd.none )
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }
