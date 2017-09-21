tests-Supplying
testAsynchronicAnchorLabeledApplying

	| supplier anchor html |

	supplier := Html5ComponentSupplier new.

	anchor := supplier asynchronicAnchorLabeled: 'Buy' applying: [ :command | command css willow ].

	html := self render: anchor.

	self assert: html equals: '<a role="button" class="willow">Buy</a>'