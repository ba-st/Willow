tests
testRenderContentOnWithDynamicLabel

	| labeledView html label|

	label := 'Field'.
	labeledView := LabeledWebView
		obtainingContentFrom: [ label ]  
		boundTo: (TextFieldWebView singleLineTriggeringOnChangeApplying: CompositeComponentCommand empty)
		applying: CompositeComponentCommand empty.

	label := 'Text Field'.
	html := self render: labeledView.

	self assert: html equals: '<label for="text-id1">Text Field<input value="" name="2" id="text-id1" type="text"/></label>'.