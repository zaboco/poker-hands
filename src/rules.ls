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
    groups hand .3 is 1 and (groups hand .2 ? 0) is 0