module Main exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing ( onClick )

-- component import example
import Components.HeaderComponent exposing ( headerComponent )
import Components.Timer exposing ( timer )
import Components.Counter exposing ( counter )
import Components.CustomButton exposing ( customButton )


-- APP
main : Program Never Model Msg
main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL
type alias Model = Int

model : Model
model = 0


-- UPDATE
type Msg = NoOp | Increment

update : Msg -> Model -> Model
update msg model =
  case msg of
    NoOp -> model
    Increment -> model + 1


-- VIEW
-- Html is defined as: elem [ attribs ][ children ]
-- CSS can be applied via class names or inline style attrib
view : Model -> Html Msg
view model =
  div [ style [( "text-align", "center" )] ][
    div[] [
      headerComponent model
      , timer model
      , counter model
      , div[] [
        customButton model
      ]
      , ul[ class "settings"] [
        li[] [
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
        , div[ class "clean-timer" ] [
          customButton model
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
