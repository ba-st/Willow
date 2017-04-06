tests-processing
testNonDefaultApplyToOn

	| html |

	html := self
		apply: BootstrapSelectCommand new + (BootstrapSelectLiveSearchCommand normalize: true placeholderText: 'Search...' style: BootstrapSelectConstants startsWith)
		toComponentDefinedBy: [ :canvas | canvas select ].

	self assert: html equals: '<select class="selectpicker" data-live-search="true" data-live-search-normalize="true" data-live-search-placeholder="Search..." data-live-search-style="startsWith"></select>'