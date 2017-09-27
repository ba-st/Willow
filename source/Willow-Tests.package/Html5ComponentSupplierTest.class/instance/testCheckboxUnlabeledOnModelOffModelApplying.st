tests-Supplying
testCheckboxUnlabeledOnModelOffModelApplying

	self
		assertRenderingOf: [ :supplier | supplier checkboxUnlabeledOnModel: 3 offModel: 'the off' applying: [ :checkbox | checkbox addClass willow ] ]
		equals: '<input class="willow" checked="checked" name="1" type="checkbox"/><input name="2" type="hidden"/>'