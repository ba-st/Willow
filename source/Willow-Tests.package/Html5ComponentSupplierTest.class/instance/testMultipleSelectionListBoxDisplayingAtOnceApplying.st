tests-Supplying
testMultipleSelectionListBoxDisplayingAtOnceApplying

	self
		assertRenderingOf: [ :supplier | supplier multipleSelectionListBoxDisplayingAtOnce: 15 applying: [ :listBox | listBox addClass willow ] ]
		equals: '<select name="1" size="15" class="willow" multiple="multiple"></select><input name="2" type="hidden"/>'