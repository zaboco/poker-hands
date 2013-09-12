require! '../src/rules'

that = it

describe \rules ->
  describe \pair ->
    that '11234 has a pair' ->
      expect rules.pair [1 1 2 3 4] .to-be-truthy!