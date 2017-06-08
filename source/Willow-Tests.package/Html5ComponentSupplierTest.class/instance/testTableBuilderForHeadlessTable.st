tests-Supplying
testTableBuilderForHeadlessTable

	| supplier table html |

	supplier := Html5ComponentSupplier new.

	table := supplier tableBuilder
		addUntitledColumnRendering: [ :number | number ];
		addUntitledColumnRendering: [ :number | number + 1 ];
		styledWith: 'fixed';
		beHeadless;
		build.

	table changeContentsTo: #(1 2 3).

	html := self render: table.

	self
		assert: html
		equals:
			'<table id="table-id1" class="fixed"><tbody><tr><td>1</td><td>2</td></tr><tr><td>2</td><td>3</td></tr><tr><td>3</td><td>4</td></tr></tbody></table>'