module Types exposing (..)


type alias Model =
    { sentence : List String
    , input : String
    , finished : Int
    }


type Msg
    = Input String
