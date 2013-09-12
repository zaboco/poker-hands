global <<< require \prelude-ls

frequency = (el, list) -->
 list |> filter (is el) |> (.length)

groups = (a) ->
 unique a |> count-by -> frequency it, a

module.exports = rules =
  pair: (hand=[]) ->
    | empty hand => false
    | _ => groups hand .2 is 1

  two-pairs: (hand=[]) ->
    | empty hand => false
    | _ => groups hand .2 is 2