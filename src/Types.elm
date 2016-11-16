module Types exposing (..)


type alias Model =
    { sentence : String
    , input : String
    }


type Msg
    = Input String
