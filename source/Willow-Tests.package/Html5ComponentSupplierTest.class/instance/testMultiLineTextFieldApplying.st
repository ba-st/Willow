tests-Supplying
testMultiLineTextFieldApplying

	self assertRenderingOf: [ :supplier | supplier multiLineTextFieldApplying: [ :textField | textField addClass willow ] ] equals: '<textarea rows="auto" cols="auto" name="1" class="willow"></textarea>'