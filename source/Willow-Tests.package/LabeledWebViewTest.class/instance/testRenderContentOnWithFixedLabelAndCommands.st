tests
testRenderContentOnWithFixedLabelAndCommands

	| labeledView html |

	labeledView := LabeledWebView displaying: 'Field' boundTo: (TextFieldWebView singleLineTriggeringOnChangeApplying: [ :command |  ]) applying: [ :command | command title: 'Some field' ].

	html := self render: labeledView.

	self assert: html equals: '<label for="text-id1" title="Some field">Field<input value="" name="2" id="text-id1" type="text"/></label>'