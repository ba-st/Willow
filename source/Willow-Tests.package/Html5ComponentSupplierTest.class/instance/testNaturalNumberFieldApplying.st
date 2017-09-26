tests-Supplying
testNaturalNumberFieldApplying

	self assertRenderingOf: [ :supplier | supplier naturalNumberFieldApplying: [ :field | field addClass willow ] ] equals: '<input value="" name="1" min="0" class="willow" type="number"/>'