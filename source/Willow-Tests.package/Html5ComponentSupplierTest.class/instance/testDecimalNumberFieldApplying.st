tests-Supplying
testDecimalNumberFieldApplying

	self assertRenderingOf: [ :supplier | supplier decimalNumberFieldApplying: [ :field | field addClass willow ] ] equals: '<input value="" name="1" type="number" class="willow"/>'