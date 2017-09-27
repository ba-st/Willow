tests-Supplying
testAsynchronicAnchorLabeledApplying

	self assertRenderingOf: [ :supplier | supplier asynchronicAnchorLabeled: 'Buy' applying: [ :anchor | anchor addClass willow ] ] equals: '<a role="button" class="willow">Buy</a>'