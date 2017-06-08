tests-Supplying
testTableBuilderWithRowCommand

	| supplier table html |

	supplier := Html5ComponentSupplier new.

	table := supplier tableBuilder
		addColumnTitled: 'Number' rendering: [ :number | number ];
		applyToEachRow: (PluggableTableRowCommand toExecute: [ :row :item :canvas | row id: canvas nextId ]);
		beHeadless;
		build.

	table changeContentsTo: #(1 2 3).

	html := self render: table.

	self assert: html equals: '<table id="table-id1"><tbody><tr id="id2"><td>1</td></tr><tr id="id3"><td>2</td></tr><tr id="id4"><td>3</td></tr></tbody></table>'