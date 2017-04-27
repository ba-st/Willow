tests-Supplying
testNaturalNumberFieldApplying

	| supplier field html |

	supplier := Html5ComponentSupplier new.

	field := supplier naturalNumberFieldApplying: (ComponentClassificationCommand toStyleWith: 'big').

	html := self render: field.

	self assert: html equals: '<input value="" name="1" class="big" min="0" type="number"/>'