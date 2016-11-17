module State exposing (..)

import Types exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Input string -> 
            let attempt = model.finished ++ string in
            if (String.startsWith attempt model.sentence)
               && (String.endsWith " " string || attempt == model.sentence)then
               ( { model | input = "", finished = model.finished ++ string }, Cmd.none )
            else
               ( { model | input = string }, Cmd.none )
