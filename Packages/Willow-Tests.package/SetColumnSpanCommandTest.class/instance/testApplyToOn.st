tests-processing
testApplyToOn

	| html |

	html := self
		apply: (SetColumnSpanCommand setting: 3)
		toComponentDefinedBy: [ :canvas | canvas tableData ].
	self assert: html equals: '<td colspan="3"></td>'