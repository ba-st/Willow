tests-Supplying
testDateFieldApplying

	self assertRenderingOf: [ :supplier | supplier dateFieldApplying: [ :field | field addClass willow ] ] equals: '<input value="" name="1" type="date" class="willow"/>'