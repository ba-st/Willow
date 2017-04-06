tests-processing
testApplyToOn

	| html |

	html := self apply: BootstrapSelectCommand new + BootstrapSelectLiveSearchCommand default toComponentDefinedBy: [ :canvas | canvas select ].

	self
		assert: html
		equals:
			'<select class="selectpicker" data-live-search="true" data-live-search-normalize="false" data-live-search-style="contains"></select>'