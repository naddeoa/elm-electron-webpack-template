module Main exposing (..)

import Html exposing (Html, div, text, input)
import Html.App


type alias Model =
    { label : String
    , text : String
    }


type Msg
    = NoOp


view : Model -> Html Msg
view model =
    div []
        [ text model.label
        , input [] [ text model.text ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


init : ( Model, Cmd Msg )
init =
    ( Model "Name" "Placeholder", Cmd.none )


main =
    Html.App.program
        { update = update
        , view = view
        , init = init
        , subscriptions = subscriptions
        }
