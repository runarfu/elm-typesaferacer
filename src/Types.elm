module Types exposing (..)

import Time exposing (Time)


type alias Model =
    { sentence : String
    , input : String
    , time : Time
    , startTime : Time
    , state : State
    }


type Msg
    = StartGame
    | Tick Time
    | Input String


type State
    = NotStarted
    | Started
