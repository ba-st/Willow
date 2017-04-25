tests-Accessing
testSynchronicButtonLabeledApplyingEvaluating

	| supplier button html |

	supplier := Html5ComponentSupplier new.

	button := supplier
		synchronicButtonLabeled: 'Search'
		applying: (ComponentClassificationCommand toStyleWith: 'big')
		evaluating: [ self fail ].

	html := self render: button.

	self assert: html equals: '<button name="1" class="big" type="submit">Search</button>'