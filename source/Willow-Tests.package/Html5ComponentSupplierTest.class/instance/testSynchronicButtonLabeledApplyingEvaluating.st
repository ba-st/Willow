tests-Supplying
testSynchronicButtonLabeledApplyingEvaluating

	| supplier button html |

	supplier := Html5ComponentSupplier new.

	button := supplier synchronicButtonLabeled: 'Search' applying: [ :command | command css willow ] evaluating: [ self fail ].

	html := self render: button.

	self assert: html equals: '<button name="1" class="willow" type="submit">Search</button>'