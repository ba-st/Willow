tests-rendering
testRenderContentOn

	| table html |

	table := TableWebView headlessDefinedBy: (Array with: (WebTableColumnRenderer untitledRenderingItemWith: [ :number | number even ])) applying: CompositeComponentCommand empty.

	html := self render: table.

	self assert: html equals: '<table id="table-id1"><tbody></tbody></table>'