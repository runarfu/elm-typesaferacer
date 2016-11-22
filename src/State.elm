module State exposing (update)

import Types exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Input string ->
            let
                remainingWords =
                    List.drop model.finished model.sentence
            in
                case List.head remainingWords of
                    Just word ->
                        notDone string word model

                    Nothing ->
                        ( model, Cmd.none )


notDone : String -> String -> Model -> ( Model, Cmd Msg )
notDone string word model =
    let
        newModel =
            if string == word ++ " " then
                { model | finished = model.finished + 1, input = "" }
            else if string == word && model.finished + 1 == List.length model.sentence then
                { model | finished = model.finished + 1, input = "" }
            else
                { model | input = string }
    in
        ( newModel, Cmd.none )
