global <<< require \prelude-ls
require! './rules'

figures = <[0 j q k a]>
figures-to-values = lists-to-obj figures, [10 to 14]
values-to-figures = lists-to-obj [10 to 14], figures

from-string = (hand-string) ->
  hand-string |> (/ '') |> map to-int

to-int = (card-sign) ->
  figures-to-values[card-sign] ? parse-int card-sign

from-int = (card-value) ->
  values-to-figures[card-value] ? card-value

to-string = (hand-cards) ->
  hand-cards |> map from-int |> (* '')

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

module.exports <<< {highest-of-same-rank, sort-cards, from-string}