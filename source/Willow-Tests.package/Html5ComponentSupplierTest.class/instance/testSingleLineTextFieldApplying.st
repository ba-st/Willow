tests-Supplying
testSingleLineTextFieldApplying

	self assertRenderingOf: [ :supplier | supplier singleLineTextFieldApplying: [ :textField | textField addClass willow ] ] equals: '<input value="" name="1" class="willow" type="text"/>'