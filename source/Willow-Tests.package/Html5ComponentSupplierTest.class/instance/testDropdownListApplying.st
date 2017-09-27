tests-Supplying
testDropdownListApplying

	self assertRenderingOf: [ :supplier | supplier dropdownListApplying: [ :dropdownList | dropdownList addClass willow ] ] equals: '<select name="1" class="willow"></select>'