global <<< require \prelude-ls

frequency = (el, list) -->
 list |> filter (is el) |> (.length)

groups = (a) ->
 unique a |> count-by -> frequency it, a

module.exports = rules =
  pair: (hand=[]) ->
    groups-of.2 is 1 and (groups-of.3 ? 0) is 0
    where groups-of = groups hand

  two-pairs: (hand=[]) ->
    groups hand .2 is 2

  three-of-a-kind: (hand=[]) ->
    (groups hand) === {3: 1, 1: 2}

  #straight: (hand=[]) ->

  full-house: (hand=[]) ->
    groups-of.3 is 1 and groups-of.2 is 1
    where groups-of = groups hand

  four-of-a-kind: (hand=[]) ->
    groups hand .4 is 1