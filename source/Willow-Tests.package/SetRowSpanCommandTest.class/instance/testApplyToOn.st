tests
testApplyToOn

	| html |

	html := self apply: (SetRowSpanCommand setting: 3) toComponentDefinedBy: [ :canvas | canvas tableData ].
	self assert: html equals: '<td rowspan="3"></td>'