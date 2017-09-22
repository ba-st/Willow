tests
testRenderContentOnWithFixedLabel

	| labeledView html |

	labeledView := LabeledWebView displaying: 'Field' boundTo: (TextFieldWebView singleLineTriggeringOnChangeApplying: [ :command |  ]) applying: [ :command |  ].

	html := self render: labeledView.

	self assert: html equals: '<label for="text-id1">Field<input value="" name="2" id="text-id1" type="text"/></label>'