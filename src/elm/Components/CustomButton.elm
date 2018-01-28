module Components.CustomButton exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import String

customButton : Int -> Html a
customButton model =
  button
    [ class "custom-btn" ]
    [ span[][ text "Start!" ] ]
