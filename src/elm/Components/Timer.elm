module Components.Timer exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import String

-- hello component
timer : Int -> Html a
timer model =
  p
    [ class "timer" ]
    [ text ( "00:15" ) ]
