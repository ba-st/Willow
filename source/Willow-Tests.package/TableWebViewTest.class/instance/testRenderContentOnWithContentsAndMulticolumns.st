tests-rendering
testRenderContentOnWithContentsAndMulticolumns

	| table html |

	table := TableWebView
		headedDefinedBy: (Array with: (WebTableMultiColumnRenderer titled: 'Common Header' renderingItemWithAll: (Array with: [ :number | number even ] with: [ :number | number odd ])))
		applying: [ :theTable |  ].

	table changeContentsTo: #(1 2 3).

	html := self render: table.

	self
		assert: html
		equals: '<table id="table-id1"><thead><th colspan="2">Common Header</th></thead><tbody><tr><td>false</td><td>true</td></tr><tr><td>true</td><td>false</td></tr><tr><td>false</td><td>true</td></tr></tbody></table>'