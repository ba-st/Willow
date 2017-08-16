tests-Supplying
testMultiLineTextFieldApplying

	| supplier textField html |

	supplier := Html5ComponentSupplier new.

	textField := supplier multiLineTextFieldApplying: (ComponentClassificationCommand toStyleWith: 'big').

	html := self render: textField.

	self assert: html equals: '<textarea rows="auto" cols="auto" name="1" class="big"></textarea>'