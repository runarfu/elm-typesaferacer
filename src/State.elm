module State exposing (..)

import Types exposing (..)
import Platform exposing (Task)
import Time exposing (Time)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Input string ->
            ( { model | input = string }, Cmd.none )

        StartGame ->
            ( model, Cmd.none )

        Tick time ->
            case model.state of
                NotStarted ->
                    ( { model | startTime = time, state = Started }, Cmd.none )

                Started ->
                    ( { model | time = time }, Cmd.none )
