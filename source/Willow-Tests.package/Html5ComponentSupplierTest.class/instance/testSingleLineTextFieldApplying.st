tests-Supplying
testSingleLineTextFieldApplying

	| supplier textField html |

	supplier := Html5ComponentSupplier new.

	textField := supplier singleLineTextFieldApplying: [ :command | command css willow ].

	html := self render: textField.

	self assert: html equals: '<input value="" name="1" class="willow" type="text"/>'