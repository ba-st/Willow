tests-Accessing
testAsynchronicButtonLabeledApplying

	| supplier button html |

	supplier := Html5ComponentSupplier new.

	button := supplier asynchronicButtonLabeled: 'Buy' applying: (ComponentClassificationCommand toStyleWith: 'big').

	html := self render: button.

	self assert: html equals: '<button class="big" type="button">Buy</button>'