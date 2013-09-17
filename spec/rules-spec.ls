require! '../src/rules'

that = it

describe \rules ->
  describe \pair ->
    that 'void hand has no pair' ->
      expect rules.pair void .to-be-falsy!
    that 'empty hand has no pair' ->
      expect rules.pair [] .to-be-falsy!
    that '11223 does not have pair' ->
      expect rules.pair [1 1 2 2 3] .to-be-falsy!
    that '11122 does not have pair' ->
      expect rules.pair [1 1 1 2 2] .to-be-falsy!
    that '11234 has pair' ->
      expect rules.pair [1 1 2 3 4] .to-be-truthy!

  describe \two-pairs ->
    that 'void hand has no pair' ->
      expect rules.two-pairs void .to-be-falsy!
    that 'empty hand has no pair' ->
      expect rules.two-pairs [] .to-be-falsy!
    that '11223 had two pairs' ->
      expect rules.two-pairs [1 1 2 2 3] .to-be-truthy!
    that '11222 does not have two pairs' ->
      expect rules.two-pairs [1 1 2 2 2] .to-be-falsy!

  describe \three-of-a-kind ->
    that 'void hand has no 3ok' ->
      expect rules.three-of-a-kind void .to-be-falsy!
    that 'empty hand has no 3ok' ->
      expect rules.three-of-a-kind [] .to-be-falsy!
    that '11123 has 3ok' ->
      expect rules.three-of-a-kind [1 1 1 2 3] .to-be-truthy!
    that '11223 has not 3ok' ->
      expect rules.three-of-a-kind [1 1 2 2 3] .to-be-falsy!
    that '11222 has not 3ok' ->
      expect rules.three-of-a-kind [1 1 2 2 2] .to-be-falsy!

  describe \straight ->
    that 'void hand has no straigh' ->
      expect rules.straight void .to-be-falsy!
    that 'empty hand has no straigh' ->
      expect rules.straight [] .to-be-falsy!
    that '12345 is straight' ->
      expect rules.straight [1 2 3 4 5] .to-equal true

  describe \full-house ->
    that 'void hand has no full' ->
      expect rules.full-house void .to-be-falsy!
    that 'empty hand has no full' ->
      expect rules.full-house [] .to-be-falsy!
    that '11133 has full' ->
      expect rules.full-house [1 1 1 3 3] .to-be-truthy!
    that '11123 has not full' ->
      expect rules.full-house [1 1 1 2 3] .to-be-falsy!

  describe \four-of-a-kind ->
    that 'void hand has no 4ok' ->
      expect rules.four-of-a-kind void .to-be-falsy!
    that 'empty hand has no 4ok' ->
      expect rules.four-of-a-kind [] .to-be-falsy!
    that '11113 has 4ok' ->
      expect rules.four-of-a-kind [1 1 1 1 3] .to-be-truthy!
    that '11223 has not 4ok' ->
      expect rules.four-of-a-kind [1 1 2 2 3] .to-be-falsy!