global <<< require \prelude-ls
require! './rules'

hands-passing = (rule, hands) -->
  hands |> filter rule

hands-distribution = (hands) ->
  rules.all |> map hands-passing _, hands

from-string = (hand-string) ->
  hand-string |> map (-> it / '' |> parse-int)

to-string = (hand-cards) ->
  hand-cards * ''

highest-of = (hands=[]) -->
  hands |> sort-by sort-cards |> last

sort-cards = (hand=[]) ->
  hand |> sort |> sort-by rules.frequency _, hand |> unique |> reverse

module.exports =
  winner: (...hands) ->
    hands
      |> map from-string
      |> hands-distribution
      |> reverse
      |> find (-> not empty it)
      |> highest-of
      |> to-string

module.exports <<< {highest-of, sort-cards}