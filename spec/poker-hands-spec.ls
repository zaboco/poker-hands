require! '../src/poker-hands'

that = it

describe \poker-hands ->
  describe \winner ->
    that '12349 wins over 12346' ->
      expect poker-hands.winner \12349 \12346 .to-equal \12349

  describe \highest-of ->
    that '12349 is higher than 12346' ->
      expect poker-hands.highest-of [[1 2 3 4 6] [1 2 3 4 9]] .to-equal [1 2 3 4 9]
    that '22345 is higher than 31146' ->
      expect poker-hands.highest-of [[2 2 3 4 5] [3 1 1 4 6]] .to-equal [2 2 3 4 5]

  describe \value-of ->
    that 'value-of 31325 is 3' ->
      expect poker-hands.value-of [3 1 3 2 5] .to-equal 3
    that 'value-of 13315 is 3' ->
      expect poker-hands.value-of [1 3 3 1 5] .to-equal 3
    that 'value-of 11155 is 1' ->
      expect poker-hands.value-of [1 1 1 5 5] .to-equal 1
    that 'value-of 28345 is 8' ->
      expect poker-hands.value-of [2 8 3 4 5] .to-equal 8