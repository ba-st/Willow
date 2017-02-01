tests-container-API
testDefinedByApplyingHeaderRenderedByApplyingToEachRow

	| table html |

	table := TableWebView
		definedBy: (Array with: (WebTableColumnRenderer titled: 'Is Even?' renderingItemWith: [ :number | number even ]))
		applying: (ComponentClassificationCommand toStyleWith: 'condensed')
		headerRenderedBy: [ :canvas |  ]
		applyingToEachRow: (PluggableTableRowCommand toExecute: [ :row :item :canvas | row id: canvas nextId ]).

	table changeContentsTo: #(1 2 3).
	html := self render: table.

	self assert: html equals: '<table id="table-id1" class="condensed"><tbody><tr id="id2"><td>false</td></tr><tr id="id3"><td>true</td></tr><tr id="id4"><td>false</td></tr></tbody></table>'