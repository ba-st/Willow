tests-rendering
testHeadedDefinedByApplying

	| table html |

	table := TableWebView headedDefinedBy: (Array with: (WebTableColumnRenderer titled: 'Is Even?' renderingItemWith: [ :number | number even ])) applying: [  ].

	html := self render: table.

	self assert: html equals: '<table id="table-id1"><thead><th>Is Even?</th></thead><tbody></tbody></table>'