global <<< require \prelude-ls

frequency = (el, list) -->
 list |> filter (is el) |> (.length)

groups = (a) ->
 unique a |> count-by -> frequency it, a

module.exports = rules =
  pair: (hand=[]) ->
    groups hand .2 is 1

  two-pairs: (hand=[]) ->
    groups hand .2 is 2

  three-of-a-kind: (hand=[]) ->
    groups-of.3 is 1 and (groups-of.2 ? 0) is 0
    where groups-of = groups hand