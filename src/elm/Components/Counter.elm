module Components.Counter exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import String

-- hello component
counter : Int -> Html a
counter model =
  div
    [ class "pomodoro-counter" ]
    [ span[] [ text ( "1/11" ) ] ]
