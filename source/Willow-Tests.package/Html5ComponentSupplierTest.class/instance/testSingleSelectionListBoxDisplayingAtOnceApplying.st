tests-Supplying
testSingleSelectionListBoxDisplayingAtOnceApplying

	self assertRenderingOf: [ :supplier | supplier singleSelectionListBoxDisplayingAtOnce: 15 applying: [ :listBox | listBox addClass willow ] ] equals: '<select name="1" size="15" class="willow"></select>'