module Components.HeaderComponent exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import String

headerComponent : Int -> Html a
headerComponent model =
  div
    [ class "h1 header-title" ]
    [ text ( "Pomodoro" ) ]
