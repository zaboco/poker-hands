require! '../src/rules'

that = it

describe \rules ->
  describe \pair ->
    that 'void hand has no pair' ->
      expect rules.pair void .to-be-falsy!
    that 'empty hand has no pair' ->
      expect rules.pair [] .to-be-falsy!
    that 'one card hand has no pair' ->
      expect rules.pair [1] .to-be-falsy!
