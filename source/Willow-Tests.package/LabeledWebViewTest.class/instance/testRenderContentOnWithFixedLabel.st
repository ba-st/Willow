tests
testRenderContentOnWithFixedLabel

	| labeledView html |

	labeledView := LabeledWebView
		displaying: 'Field'
		boundTo: (TextFieldWebView singleLineTriggeringOnChangeApplying: CompositeComponentCommand empty)
		applying: CompositeComponentCommand empty.

	html := self render: labeledView.

	self assert: html equals: '<label for="text-id1">Field<input value="" name="2" id="text-id1" type="text"/></label>'