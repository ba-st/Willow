tests-Supplying
testTableBuilderWithSimpleColumns

	| supplier table html |

	supplier := Html5ComponentSupplier new.

	table := supplier tableBuilder
		addColumnTitled: 'Number' rendering: [ :number | number ];
		addColumnTitled: 'Even?' rendering: [ :number | number even ];
		build.

	table changeContentsTo: #(1 2 3).

	html := self render: table.

	self
		assert: html
		equals:
			'<table id="table-id1"><thead><th>Number</th><th>Even?</th></thead><tbody><tr><td>1</td><td>false</td></tr><tr><td>2</td><td>true</td></tr><tr><td>3</td><td>false</td></tr></tbody></table>'