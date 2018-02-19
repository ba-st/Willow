tests-Supplying
testSynchronicButtonLabeledApplying

	self
		assertRenderingOf:
			[ :supplier | supplier synchronicButtonLabeled: 'Search' applying: [ :button | button addClass willow ] ]
		equals: '<button class="willow" type="submit">Search</button>'