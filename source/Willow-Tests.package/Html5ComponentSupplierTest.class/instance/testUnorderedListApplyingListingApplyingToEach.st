tests-Supplying
testUnorderedListApplyingListingApplyingToEach

	self
		assertRenderingOf: [ :supplier | supplier unorderedListApplying: [ :list | list labelItemsWith: [ :item | 'N.<1p>' expandMacrosWith: item ] ] listing: #(1 2 3) applyingToEach: [ :listItem | listItem addClass willow ] ]
		equals: '<ul><li class="willow">N.1</li><li class="willow">N.2</li><li class="willow">N.3</li></ul>'