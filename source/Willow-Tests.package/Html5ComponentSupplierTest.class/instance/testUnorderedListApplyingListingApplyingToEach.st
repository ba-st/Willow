tests-Supplying
testUnorderedListApplyingListingApplyingToEach

	| supplier list html |

	supplier := Html5ComponentSupplier new.

	list := supplier unorderedListApplying: [ :command | command listLabeling: [ :item | 'N.<1p>' expandMacrosWith: item ] ] listing: #(1 2 3) applyingToEach: [ :command | command css willow ].

	html := self render: list.

	self assert: html equals: '<ul><li class="willow">N.1</li><li class="willow">N.2</li><li class="willow">N.3</li></ul>'