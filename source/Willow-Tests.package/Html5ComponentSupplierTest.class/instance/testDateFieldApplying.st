tests-Supplying
testDateFieldApplying

	| supplier field html |

	supplier := Html5ComponentSupplier new.

	field := supplier dateFieldApplying: [ :command | command css willow ].

	html := self render: field.

	self assert: html equals: '<input value="" name="1" class="willow" type="date"/>'