module Main exposing (main)

import Html as Html
import String
import State exposing (..)
import Types exposing (..)
import Views exposing (..)


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initModel
        , view = view
        , update = update
        }


initModel : Model
initModel =
    { wordsToWrite = String.words "Elm sure is cool."
    , history = []
    , input = ""
    }
