tests-Supplying
testDecimalNumberFieldApplying

	| supplier field html |

	supplier := Html5ComponentSupplier new.

	field := supplier decimalNumberFieldApplying: [ :command | command css willow ].

	html := self render: field.

	self assert: html equals: '<input value="" name="1" class="willow" type="number"/>'