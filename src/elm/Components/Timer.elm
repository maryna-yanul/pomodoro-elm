module Components.Timer exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Time exposing (Time, inSeconds, inMinutes, minute)
import String exposing (padLeft)


type alias Model =
  { timeTotal : Time
  }

init : (Model, Cmd Msg)
init =
  ( { timeTotal = 15 * minute }
  , Cmd.none
  )

type Msg = Start | Stop

timer : Model -> Html a
timer model =
  let
    min = inMinutes model.timeTotal
      |> truncate
      |> toFloat
    sec = model.timeTotal - minute * min
      |> inSeconds
      |> truncate
  in
    p
      [ class "timer" ]
      [ span
        [ class "timerMin" ]
        [ min
            |> toString
            |> padLeft 2 '0'
            |> text
        ]
      , span
        [ class "timerSep" ]
        [ text ":" ]
      , span
        [ class "timerSec" ]
        [ sec
            |> toString
            |> padLeft 2 '0'
            |> text
        ]
      ]
