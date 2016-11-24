module State exposing (update)

import Types exposing (..)


update : Msg -> Model -> Model
update msg model =
    case msg of
        Input input ->
            model
                |> updateInput input
                |> moveWordToHistoryIfCorrect


updateInput : String -> Model -> Model
updateInput string model =
    { model | input = string }


moveWordToHistoryIfCorrect : Model -> Model
moveWordToHistoryIfCorrect model =
    let
        moveWordToHistory word newWordsToWrite =
            { model
                | wordsToWrite = newWordsToWrite
                , history = model.history ++ [ word ]
                , input = ""
            }
    in
        case model.wordsToWrite of
            lastWord :: [] ->
                if model.input == lastWord then
                    moveWordToHistory lastWord []
                else
                    model

            firstWord :: rest ->
                if model.input == (firstWord ++ " ") then
                    moveWordToHistory firstWord rest
                else
                    model

            _ ->
                model
