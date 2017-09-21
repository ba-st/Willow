tests-Supplying
testNaturalNumberFieldApplying

	| supplier field html |

	supplier := Html5ComponentSupplier new.

	field := supplier naturalNumberFieldApplying: [ :command | command css willow ].

	html := self render: field.

	self assert: html equals: '<input value="" name="1" class="willow" min="0" type="number"/>'