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
    that '12 has no pair' ->
      expect rules.pair [1 2] .to-be-falsy!
    that '11 has pair' ->
      expect rules.pair [1 1] .to-be-truthy!
    that '121 has pair' ->
      expect rules.pair [1 2 1] .to-be-truthy!
    that '122 has pair' ->
      expect rules.pair [1 2 2] .to-be-truthy!
    that '1122 does not have pair' ->
      expect rules.pair [1 1 2 2] .to-be-falsy!
    that '11122 does not have pair' ->
      expect rules.pair [1 1 1 2 2] .to-be-truthy!

  describe \two-pairs ->
    that 'void hand has no pair' ->
      expect rules.two-pairs void .to-be-falsy!
    that 'empty hand has no pair' ->
      expect rules.two-pairs [] .to-be-falsy!
