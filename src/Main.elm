module Main exposing (..)

import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main : Program Never
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { count : Int }


init : ( Model, Cmd Msg )
init =
    ( Model 1, Cmd.none )



-- UPDATE


type Msg
    = Count


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Count ->
            ( { model | count = model.count + 1 }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "row content" ]
        [ div
            [ class "col s10 offset-s1" ]
            [ h1 [] [ text "Elmoin Starter Kit" ]
            , img [ class "logo", src "./elmoin-logo.png" ] []
            , footer [ class "footer" ]
                [ h3 [ class "" ] [ text <| toString model.count ++ "x Moin Moin Elmoin!" ]
                , a
                    [ class "waves-effect waves-light btn-large btn-more", onClick Count ]
                    [ text <| "Mooooooooooore Moin!" ]
                ]
            ]
        ]
