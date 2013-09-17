global <<< require \prelude-ls
require! './rules'

from-string = (hand-string) ->
  hand-string |> map (-> it / '' |> parse-int)

to-string = (hand-cards) ->
  hand-cards * ''

hands-by-rank = (hands) ->
  rules.all |> map filter _, hands

highest-of-same-rank = (hands=[]) -->
  hands |> sort-by sort-cards |> last

sort-cards = (hand=[]) ->
  hand |> sort |> sort-by rules.frequency _, hand |> unique |> reverse

module.exports =
  winner: (...hands) ->
    hands
      |> map from-string
      |> hands-by-rank
      |> reverse
      |> find (not) << empty
      |> highest-of-same-rank
      |> to-string

module.exports <<< {highest-of-same-rank, sort-cards}