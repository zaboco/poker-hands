require! '../src/poker-hands'

that = it

describe \poker-hands ->
  describe \winner ->
    that '12349 wins over 12346' ->
      expect poker-hands.winner \12349 \12346 .to-equal \12349
    that 'one pair > high-card' ->
      expect poker-hands.winner \12149 \12346 .to-equal \12149
    that 'pair of 3 > pair of 1' ->
      expect poker-hands.winner \11249 \31346 .to-equal \31346
    that 'pair with 9 high card > pair with 5 high card' ->
      expect poker-hands.winner \11249 \11345 .to-equal \11249
    that '2pairs > pair' ->
      expect poker-hands.winner \11229 \31346 .to-equal \11229
    that '2pairs with 5 > 2pairs with 4' ->
      expect poker-hands.winner \11225 \11224 .to-equal \11225
    that '3of-a-kind > 2pairs' ->
      expect poker-hands.winner \11125 \11224 .to-equal \11125
    that 'straight > 3of-a-kind' ->
      expect poker-hands.winner \12345 \11124 .to-equal \12345
    that 'higher straight > lower straight' ->
      expect poker-hands.winner \12345 \34567 .to-equal \34567
    that 'full > straight' ->
      expect poker-hands.winner \12345 \11122 .to-equal \11122
    that '4of-a-kind > full' ->
      expect poker-hands.winner \33334 \11122 .to-equal \33334
    that '4 of 9s > anything' ->
      expect poker-hands.winner \99991 \11122 \23456 \33356 \44556 \77685 \14678 .to-equal \99991

  describe \highest-of ->
    that '12349 is higher than 12346' ->
      expect poker-hands.highest-of [[1 2 3 4 6] [1 2 3 4 9]] .to-equal [1 2 3 4 9]
    that '22345 is higher than 31146' ->
      expect poker-hands.highest-of [[2 2 3 4 5] [3 1 1 4 6]] .to-equal [2 2 3 4 5]

  describe \value-of ->
    that 'value-of 31325 is 3' ->
      expect poker-hands.value-of [3 1 3 2 5] .to-equal [3 5 2 1]
    that 'value-of 13315 is 3' ->
      expect poker-hands.value-of [1 3 3 1 5] .to-equal [3 1 5]
    that 'value-of 11155 is 1' ->
      expect poker-hands.value-of [1 1 1 5 5] .to-equal [1 5]
    that 'value-of 28345 is 8' ->
      expect poker-hands.value-of [2 8 3 4 5] .to-equal [8 5 4 3 2]
