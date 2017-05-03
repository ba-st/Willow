tests-Supplying
testSingleLineTextFieldApplying

	| supplier textField html |

	supplier := Html5ComponentSupplier new.

	textField := supplier singleLineTextFieldApplying: (ComponentClassificationCommand toStyleWith: 'big').

	html := self render: textField.

	self assert: html equals: '<input value="" name="1" class="big" type="text"/>'