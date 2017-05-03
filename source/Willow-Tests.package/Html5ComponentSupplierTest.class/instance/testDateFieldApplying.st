tests-Supplying
testDateFieldApplying

	| supplier field html |

	supplier := Html5ComponentSupplier new.

	field := supplier dateFieldApplying: (ComponentClassificationCommand toStyleWith: 'big').

	html := self render: field.

	self assert: html equals: '<input value="" name="1" class="big" type="date"/>'