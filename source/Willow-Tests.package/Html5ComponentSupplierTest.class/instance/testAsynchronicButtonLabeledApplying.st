tests-Supplying
testAsynchronicButtonLabeledApplying

	| supplier button html |

	supplier := Html5ComponentSupplier new.

	button := supplier asynchronicButtonLabeled: 'Buy' applying: [ :command | command css willow ].

	html := self render: button.

	self assert: html equals: '<button class="willow" type="button">Buy</button>'