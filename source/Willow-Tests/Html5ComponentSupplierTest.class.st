"
A Html5ComponentSupplierTest is a test class for testing the behavior of Html5ComponentSupplier
"
Class {
	#name : #Html5ComponentSupplierTest,
	#superclass : #WARenderingTest,
	#category : #'Willow-Tests-Frontend'
}

{ #category : #private }
Html5ComponentSupplierTest >> assertRenderingOf: aComponentCreationBlock equals: anExpectedHtml [

	| component html |

	component := aComponentCreationBlock value: Html5ComponentSupplier new.

	html := self render: component.

	self assert: html equals: anExpectedHtml
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testAsynchronicButtonLabeledApplying [

	self assertRenderingOf: [ :supplier | supplier asynchronicButtonLabeled: 'Buy' applying: [ :button | button addClass willow ] ] equals: '<button class="willow" type="button">Buy</button>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testAsynchronicLinkLabeledApplying [

	self assertRenderingOf: [ :supplier | supplier asynchronicLinkLabeled: 'Buy' applying: [ :link | link addClass willow ] ] equals: '<a id="a-id1" class="willow">Buy</a><script type="text/javascript">$("#a-id1").click(function(event){arguments[0].preventDefault()});</script>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testCheckboxLabeledOnModelOffModelApplying [

	self
		assertRenderingOf: [ :supplier | 
			supplier
				checkboxLabeled: 'Labelization'
				onModel: 3
				offModel: 'the off'
				applying: [ :checkbox | checkbox addClass willow ] ]
		equals: '<input class="willow" checked="checked" name="1" id="checkbox-id2" type="checkbox"/><input name="3" type="hidden"/><label for="checkbox-id2">Labelization</label>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testCheckboxUnlabeledOnModelOffModelApplying [

	self
		assertRenderingOf: [ :supplier | supplier checkboxUnlabeledOnModel: 3 offModel: 'the off' applying: [ :checkbox | checkbox addClass willow ] ]
		equals: '<input class="willow" checked="checked" name="1" type="checkbox"/><input name="2" type="hidden"/>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testDateFieldApplying [

	self assertRenderingOf: [ :supplier | supplier dateFieldApplying: [ :field | field addClass willow ] ] equals: '<input value="" name="1" type="date" class="willow"/>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testDecimalNumberFieldApplying [

	self assertRenderingOf: [ :supplier | supplier decimalNumberFieldApplying: [ :field | field addClass willow ] ] equals: '<input value="" name="1" type="number" class="willow"/>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testDelayedViewShowingWhileEvaluatingThenRendering [

	self
		assertRenderingOf: [ :supplier | supplier delayedViewShowing: 'Loading...' whileEvaluating: [  ] thenRendering: 'Done!' ]
		equals: '<div id="Delayed-id1">Loading...</div><script type="text/javascript">Willow.callServer({"url":"/","data":"2"});</script>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testDropdownListApplying [

	self assertRenderingOf: [ :supplier | supplier dropdownListApplying: [ :dropdownList | dropdownList addClass willow ] ] equals: '<select name="1" class="willow"></select>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testFieldSetContainingApplyingWithLegendApplying [

	self
		assertRenderingOf: [ :supplier | 
			supplier
				fieldSetContaining: 'The View'
				applying: [ :fieldSet | fieldSet beDisabled ]
				withLegend: 'Its Title'
				applying: [ :legend | legend beAutofocused ] ]
		equals: '<fieldset disabled="disabled"><legend autofocus="autofocus">Its Title</legend>The View</fieldset>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testMultiLineTextFieldApplying [

	self assertRenderingOf: [ :supplier | supplier multiLineTextFieldApplying: [ :textField | textField addClass willow ] ] equals: '<textarea rows="auto" cols="auto" name="1" class="willow"></textarea>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testMultipleSelectionListBoxDisplayingAtOnceApplying [

	self
		assertRenderingOf: [ :supplier | supplier multipleSelectionListBoxDisplayingAtOnce: 15 applying: [ :listBox | listBox addClass willow ] ]
		equals: '<select name="1" size="15" class="willow" multiple="multiple"></select><input name="2" type="hidden"/>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testNaturalNumberFieldApplying [

	self assertRenderingOf: [ :supplier | supplier naturalNumberFieldApplying: [ :field | field addClass willow ] ] equals: '<input value="" name="1" type="number" min="0" class="willow"/>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testRadioRenderingWithApplyingToLabelApplyingToInput [

	self
		assertRenderingOf:
			[ :supplier | supplier radioRenderingWith: #asUppercase applyingToLabel: [ :radio | radio addClass willow ] applyingToInput: [ :radio | radio addClass willow ] ]
		equals: ''.

	self
		assertRenderingOf: [ :supplier | 
			(supplier radioRenderingWith: #asUppercase applyingToLabel: [ :radio | radio addClass willow ] applyingToInput: [ :radio | radio addClass willow ])
				allowAnyOf: #(f h);
				yourself ]
		equals:
			'<label for="radio-button-id2" class="willow"><input name="1" id="radio-button-id2" class="willow" value="1" type="radio"/>F</label><label for="radio-button-id3" class="willow"><input name="1" id="radio-button-id3" class="willow" value="2" type="radio"/>H</label>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testSingleLineTextFieldApplying [

	self assertRenderingOf: [ :supplier | supplier singleLineTextFieldApplying: [ :textField | textField addClass willow ] ] equals: '<input value="" name="1" class="willow" type="text"/>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testSingleSelectionListBoxDisplayingAtOnceApplying [

	self assertRenderingOf: [ :supplier | supplier singleSelectionListBoxDisplayingAtOnce: 15 applying: [ :listBox | listBox addClass willow ] ] equals: '<select name="1" size="15" class="willow"></select>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testSynchronicButtonLabeledApplyingEvaluating [

	self
		assertRenderingOf: [ :supplier | 
			supplier
				synchronicButtonLabeled: 'Search'
				applying: [ :button | button addClass willow ]
				evaluating: [ self fail ] ]
		equals: '<button name="1" class="willow" type="submit">Search</button>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testTableBuilderForHeadlessTable [

	| supplier table html |

	supplier := Html5ComponentSupplier new.

	table := supplier tableBuilder
		addColumn: [ :column | column rendering: [ :number | number ] ];
		addColumn: [ :column | column rendering: [ :number | number + 1 ] ];
		styledWith: 'fixed';
		build.

	table changeContentsTo: #(1 2 3).

	html := self render: table.

	self
		assert: html
		equals:
			'<table id="table-id1" class="fixed"><tbody><tr><td>1</td><td>2</td></tr><tr><td>2</td><td>3</td></tr><tr><td>3</td><td>4</td></tr></tbody></table>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testTableBuilderWithFooter [

	| supplier table html |

	supplier := Html5ComponentSupplier new.

	table := supplier tableBuilder
		addColumn: [ :column | 
			column
				titled: 'Number';
				rendering: [ :number | number ] ];
		addColumn: [ :column | 
			column
				titled: 'Even?';
				rendering: [ :number | number even ];
				summarizedWith: [ 'Fixed Footer' ] ];
		build.

	table changeContentsTo: #(1 2 3).

	html := self render: table.

	self
		assert: html
		equals:
			'<table id="table-id1"><thead><th>Number</th><th>Even?</th></thead><tbody><tr><td>1</td><td>false</td></tr><tr><td>2</td><td>true</td></tr><tr><td>3</td><td>false</td></tr></tbody><tfoot><td></td><td>Fixed Footer</td></tfoot></table>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testTableBuilderWithRowCommand [

	| supplier table html |

	supplier := Html5ComponentSupplier new.

	table := supplier tableBuilder
		addColumn: [ :column | column rendering: [ :number | number ] ];
		applyToEachRow: (PluggableTableRowCommand toExecute: [ :row :item :canvas | row id: canvas nextId ]);
		build.

	table changeContentsTo: #(1 2 3).

	html := self render: table.

	self
		assert: html
		equals:
			'<table id="table-id1"><tbody><tr id="id2"><td>1</td></tr><tr id="id3"><td>2</td></tr><tr id="id4"><td>3</td></tr></tbody></table>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testTableBuilderWithSimpleColumns [

	| supplier table html |

	supplier := Html5ComponentSupplier new.

	table := supplier tableBuilder
		addColumn: [ :column | 
			column
				titled: 'Number';
				rendering: [ :number | number ] ];
		addColumn: [ :column | 
			column
				titled: 'Even?';
				rendering: [ :number | number even ] ];
		build.

	table changeContentsTo: #(1 2 3).

	html := self render: table.

	self
		assert: html
		equals:
			'<table id="table-id1"><thead><th>Number</th><th>Even?</th></thead><tbody><tr><td>1</td><td>false</td></tr><tr><td>2</td><td>true</td></tr><tr><td>3</td><td>false</td></tr></tbody></table>'
]

{ #category : #'tests-Supplying' }
Html5ComponentSupplierTest >> testUnorderedListApplyingListingApplyingToEach [

	self
		assertRenderingOf: [ :supplier | supplier unorderedListApplying: [ :list | list labelItemsWith: [ :item | 'N.<1p>' expandMacrosWith: item ] ] listing: #(1 2 3) applyingToEach: [ :listItem | listItem addClass willow ] ]
		equals: '<ul><li class="willow">N.1</li><li class="willow">N.2</li><li class="willow">N.3</li></ul>'
]

{ #category : #'tests-Processing' }
Html5ComponentSupplierTest >> testUpdateRoot [

	| html |

	html := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | Html5ComponentSupplier new updateRoot: root ];
		render: [ :canvas |  ].

	self
		assert: html
		equals:
			'<!DOCTYPE html><html><head><title></title></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'
]
