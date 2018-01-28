module Main exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing ( onClick )

-- component import example
import Components.HeaderComponent exposing ( headerComponent )
import Components.Timer
import Components.Counter exposing ( counter )
import Components.CustomButton exposing ( customButton )


-- APP
main : Program Never Model Msg
main =
  Html.program
    { init = init
    , subscriptions = subscriptions
    , update = update
    , view = view }


-- MODEL
type alias Model = { timer : Components.Timer.Model }

initialModel : Components.Timer.Model -> Model
initialModel timer =
  { timer = timer }

init : (Model, Cmd Msg)
init =
  let
    (timer, timerMsg) = Components.Timer.init
    model = initialModel timer
  in
    ( model
    , Cmd.map TimerMsg timerMsg
    )

-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- UPDATE
type Msg
  = NoOp
  | TimerMsg Components.Timer.Msg

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NoOp -> (model, Cmd.none)
    TimerMsg m -> (model, Cmd.none)


-- VIEW
-- Html is defined as: elem [ attribs ][ children ]
-- CSS can be applied via class names or inline style attrib
view : Model -> Html Msg
view model =
  div [ style [( "text-align", "center" )] ][
    div[] [
      headerComponent 42
      , Components.Timer.timer model.timer
      , counter 42
      , ul [ class "settings"] [
        li [ class "clean-status" ] [
          span[] [
            ( text "Clean Status" )
          ]
          , img [ src "static/img/clean.svg" ] []
        ]
        , li[] [
          span[] [
            ( text "Pomodoro Length" )
          ]
          , input [ type_ "number", placeholder "0" ] []
        ]
        , li[] [
          span[] [
            ( text "Pomodoro Break Length" )
          ]
          , input [ type_ "number", placeholder "0" ] []
        ]
        , li[] [
          span[] [
            ( text "Long Break Length" )
          ]
          , input [ type_ "number", placeholder "0" ] []
        ]
        , li[] [
          span[] [
            ( text "Target Pomodoros Per Day" )
          ]
          , input [ type_ "number", placeholder "0" ] []
        ]
        , div[] [
          customButton 42
        ]
      ]
    ]
  ]


-- CSS STYLES
styles : { img : List ( String, String ) }
styles =
  {
    img = [ ( "width", "200px" ) ]
  }
