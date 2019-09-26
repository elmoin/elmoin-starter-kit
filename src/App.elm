module App exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> init
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
    let
        repoUrl =
            "https://github.com/elmoin/elmoin-starter-kit"
    in
    div [ class "col-12 center" ]
        [ a [ href repoUrl ]
            [ h1 [] [ text "Elmoin Starter Kit" ]
            ]
        , a [ href repoUrl ]
            [ img [ class "col-3", src "./elmoin-logo.png" ] []
            ]
        , footer []
            [ h2 [ class "h2" ] [ text <| String.fromInt model.count ++ "x Moin Moin Elmoin!" ]
            , a
                [ class "btn btn-primary btn-more h2 p2", onClick Count ]
                [ text "Have fun!" ]
            ]
        ]
