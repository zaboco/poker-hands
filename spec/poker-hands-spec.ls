require! '../src/poker-hands'

that = it

describe \poker-hands ->
  describe \winner ->
    that '12349 wins over 12346' ->
      expect poker-hands.winner \12349 \12346 .to-equal \12349