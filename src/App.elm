module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main : Program Never Model Msg
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
    div [ class "col-12 center" ]
        [ h1 [] [ text "Elmoin Starter Kit" ]
        , img [ class "col-3", src "./elmoin-logo.png" ] []
        , footer []
            [ h2 [ class "h2" ] [ text <| toString model.count ++ "x Moin Moin Elmoin!" ]
            , a
                [ class "btn btn-primary btn-more h2 p2", onClick Count ]
                [ text "Mooooooooooore Moin!" ]
            ]
        ]
