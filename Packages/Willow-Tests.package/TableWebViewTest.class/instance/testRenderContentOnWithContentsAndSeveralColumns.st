tests-container-API
testRenderContentOnWithContentsAndSeveralColumns

	| table html |

	table := TableWebView
		headlessDefinedBy: (Array with: (WebTableColumnRenderer untitledRenderingItemWith: [ :number | number even ]) with: (WebTableColumnRenderer untitledRenderingItemWith: [ :number | number odd ]))
		applying: CompositeComponentCommand empty.

	table changeContentsTo: #(1 2 3).

	html := self render: table.

	self assert: html equals: '<table id="table-id1"><tbody><tr><td>false</td><td>true</td></tr><tr><td>true</td><td>false</td></tr><tr><td>false</td><td>true</td></tr></tbody></table>'