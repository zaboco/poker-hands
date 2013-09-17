global <<< require \prelude-ls

frequency = (el, list) -->
 list |> filter (is el) |> (.length)

groups = (a) ->
 unique a |> count-by -> frequency it, a

module.exports = rules =
  pair: (hand=[]) ->
    (groups hand) === {2: 1, 1: 3}

  two-pairs: (hand=[]) ->
    groups hand .2 is 2

  three-of-a-kind: (hand=[]) ->
    (groups hand) === {3: 1, 1: 2}

  straight: (hand=[]) ->

  full-house: (hand=[]) ->
    (groups hand) === {3: 1, 2: 1}

  four-of-a-kind: (hand=[]) ->
    groups hand .4 is 1