module Main exposing (..)

import Html exposing (Html, div, text, input)


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


main : Program Never Model Msg
main =
    Html.program
        { update = update
        , view = view
        , init = init
        , subscriptions = subscriptions
        }
