"
A TableWebViewTest is a test class for testing the behavior of TableWebView
"
Class {
	#name : #TableWebViewTest,
	#superclass : #WARenderingTest,
	#instVars : [
		'notificationWasReceived'
	],
	#category : 'Willow-Tests-WebViews'
}

{ #category : #private }
TableWebViewTest >> changeNotifiedBy: aTableWebView [ 
	
	notificationWasReceived := true
]

{ #category : #'tests-container-API' }
TableWebViewTest >> testContents [

	| table |

	table := TableWebViewBuilder new build.

	self assert: table contents isEmpty.

	notificationWasReceived := false.
	table
		notifyChangesTo: self;
		changeContentsTo: #(1 2 3).

	self
		assert: table contents equals: #(1 2 3);
		assert: notificationWasReceived
]

{ #category : #'tests-rendering' }
TableWebViewTest >> testDefinedByApplyingHeaderRenderedByApplyingToEachRow [

	| table html |

	table := TableWebViewBuilder new
		addColumn: [ :column | column rendering: [ :number | number even ] ];
		applyToEachRow: (PluggableTableRowCommand toExecute: [ :row :item :canvas | row id: canvas nextId ]);
		buildApplying: [ :theTable | theTable addClass willow ].

	table changeContentsTo: #(1 2 3).
	html := self render: table.

	self
		assert: html
		equals:
			'<table id="table-id1" class="willow"><tbody><tr id="id2"><td>false</td></tr><tr id="id3"><td>true</td></tr><tr id="id4"><td>false</td></tr></tbody></table>'
]

{ #category : #'tests-rendering' }
TableWebViewTest >> testHeadedDefinedByApplying [

	| table html |

	table := TableWebViewBuilder new
		addColumn: [ :column | 
			column
				titled: 'Is Even?';
				rendering: [ :number | number even ] ];
		build.

	html := self render: table.

	self assert: html equals: '<table id="table-id1"><thead><th>Is Even?</th></thead><tbody></tbody></table>'
]

{ #category : #'tests-rendering' }
TableWebViewTest >> testHeadedDefinedByApplyingWithContents [

	| table html |

	table := TableWebViewBuilder new
		addColumn: [ :column | 
			column
				titled: 'Is Even?';
				rendering: [ :number | number even ] ];
		build.

	table changeContentsTo: #(1 2 3).
	html := self render: table.

	self assert: html equals: '<table id="table-id1"><thead><th>Is Even?</th></thead><tbody><tr><td>false</td></tr><tr><td>true</td></tr><tr><td>false</td></tr></tbody></table>'
]

{ #category : #'tests-rendering' }
TableWebViewTest >> testOnTrigger [

	| table html |

	table := TableWebViewBuilder new
		addColumn: [ :column | column rendering: [ :number | number even ] ];
		build.

	table onTrigger disable.

	html := self render: table.

	self
		assert: html
			equals:
			'<table id="table-id1"><tbody></tbody></table><script type="text/javascript">$("#table-id1").click(function(event){$(this).prop("disabled",true)});</script>';
		assert: table identifier equals: 'table-id1'
]

{ #category : #'tests-rendering' }
TableWebViewTest >> testRenderContentOn [

	| table html |

	table := TableWebViewBuilder new
		addColumn: [ :column | column rendering: [ :number | number even ] ];
		build.

	html := self render: table.

	self assert: html equals: '<table id="table-id1"><tbody></tbody></table>'
]

{ #category : #'tests-rendering' }
TableWebViewTest >> testRenderContentOnWithContents [

	| table html |

	table := TableWebViewBuilder new
		addColumn: [ :column | column rendering: [ :number | number even ] ];
		build.

	table changeContentsTo: #(1 2 3).

	html := self render: table.

	self
		assert: html
		equals: '<table id="table-id1"><tbody><tr><td>false</td></tr><tr><td>true</td></tr><tr><td>false</td></tr></tbody></table>'
]

{ #category : #'tests-rendering' }
TableWebViewTest >> testRenderContentOnWithContentsAndMulticolumns [

	| table html |

	table := TableWebViewBuilder new
		addColumnTitled: 'Common Header' renderingAll: (Array with: [ :number | number even ] with: [ :number | number odd ]);
		build.

	table changeContentsTo: #(1 2 3).

	html := self render: table.

	self
		assert: html
		equals:
			'<table id="table-id1"><thead><th colspan="2">Common Header</th></thead><tbody><tr><td>false</td><td>true</td></tr><tr><td>true</td><td>false</td></tr><tr><td>false</td><td>true</td></tr></tbody></table>'
]

{ #category : #'tests-rendering' }
TableWebViewTest >> testRenderContentOnWithContentsAndSeveralColumns [

	| table html |

	table := TableWebViewBuilder new
		addColumn: [ :column | column rendering: [ :number | number even ] ];
		addColumn: [ :column | column rendering: [ :number | number odd ] ];
		build.

	table changeContentsTo: #(1 2 3).

	html := self render: table.

	self
		assert: html
		equals:
			'<table id="table-id1"><tbody><tr><td>false</td><td>true</td></tr><tr><td>true</td><td>false</td></tr><tr><td>false</td><td>true</td></tr></tbody></table>'
]

{ #category : #'tests-rendering' }
TableWebViewTest >> testTableWithFooterSupport [

	| table html |

	table := TableWebViewBuilder new
		addColumn: [ :column | 
			column
				rendering: [ :number :index | index ];
				summarizedWith: [ 'Even count' ] ];
		addColumn: [ :column | 
			column
				titled: 'Is Even?';
				rendering: [ :number | number even ];
				summarizedWith: [ :numbers | (numbers select: #even) size ] ];
		applyToEachRow: (PluggableTableRowCommand toExecute: [ :row :item :canvas | row id: canvas nextId ]);
		buildApplying: [ :theTable | theTable addClass willow ].

	table changeContentsTo: #(1 2 3).
	html := self render: table.

	self
		assert: html
		equals:
			'<table id="table-id1" class="willow"><thead><th></th><th>Is Even?</th></thead><tbody><tr id="id2"><td>1</td><td>false</td></tr><tr id="id3"><td>2</td><td>true</td></tr><tr id="id4"><td>3</td><td>false</td></tr></tbody><tfoot><td>Even count</td><td>1</td></tfoot></table>'
]
