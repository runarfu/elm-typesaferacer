module Types exposing (..)


type alias Model =
    { sentence : String
    , input : String
    , finished : String
    }


type Msg
    = Input String
