tests-Supplying
testSynchronicButtonLabeledApplyingEvaluating

	self
		assertRenderingOf: [ :supplier | supplier synchronicButtonLabeled: 'Search' applying: [ :button | button addClass willow ] evaluating: [ self fail ] ]
		equals: '<button name="1" class="willow" type="submit">Search</button>'