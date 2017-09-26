tests-Supplying
testNaturalNumberFieldApplying

	self assertRenderingOf: [ :supplier | supplier naturalNumberFieldApplying: [ :field | field addClass willow ] ] equals: '<input value="" name="1" class="willow" min="0" type="number"/>'