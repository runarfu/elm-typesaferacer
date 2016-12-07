module Types exposing (..)


type alias Model =
    { wordsToWrite : List String
    , history : List String
    , input : String
    }


type Msg
    = Input String
