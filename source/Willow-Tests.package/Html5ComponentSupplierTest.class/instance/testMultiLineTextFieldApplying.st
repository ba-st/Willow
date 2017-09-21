tests-Supplying
testMultiLineTextFieldApplying

	| supplier textField html |

	supplier := Html5ComponentSupplier new.

	textField := supplier multiLineTextFieldApplying: [ :command | command css willow ].

	html := self render: textField.

	self assert: html equals: '<textarea rows="auto" cols="auto" name="1" class="willow"></textarea>'