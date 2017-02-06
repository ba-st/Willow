tests-rendering
testRenderContentOnWithContents

	| table html |

	table := TableWebView headlessDefinedBy: (Array with: (WebTableColumnRenderer untitledRenderingItemWith: [ :number | number even ])) applying: CompositeComponentCommand empty.

	table changeContentsTo: #(1 2 3).

	html := self render: table.

	self assert: html equals: '<table id="table-id1"><tbody><tr><td>false</td></tr><tr><td>true</td></tr><tr><td>false</td></tr></tbody></table>'