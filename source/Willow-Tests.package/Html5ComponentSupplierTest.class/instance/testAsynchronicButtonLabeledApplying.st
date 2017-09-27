tests-Supplying
testAsynchronicButtonLabeledApplying

	self assertRenderingOf: [ :supplier | supplier asynchronicButtonLabeled: 'Buy' applying: [ :button | button addClass willow ] ] equals: '<button class="willow" type="button">Buy</button>'