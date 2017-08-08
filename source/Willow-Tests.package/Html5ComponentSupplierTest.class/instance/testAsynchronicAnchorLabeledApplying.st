tests-Supplying
testAsynchronicAnchorLabeledApplying

	| supplier anchor html |

	supplier := Html5ComponentSupplier new.

	anchor := supplier asynchronicAnchorLabeled: 'Buy' applying: (ComponentClassificationCommand toStyleWith: 'big').

	html := self render: anchor.

	self assert: html equals: '<a role="button" class="big">Buy</a>'