"
A LabeledWebViewTest is a test class for testing the behavior of LabeledWebView
"
Class {
	#name : #LabeledWebViewTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-WebViews'
}

{ #category : #tests }
LabeledWebViewTest >> testRenderContentOnWithDynamicLabel [

	| labeledView html label |

	label := 'Field'.
	labeledView := LabeledWebView
		obtainingContentFrom: [ label ]
		boundTo: (TextFieldWebView singleLineTriggeringOnChangeApplying: [ :textField |  ])
		applying: [ :container |  ].

	label := 'Text Field'.
	html := self render: labeledView.

	self
		assert: html
		equals:
			'<label for="text-id1">Text Field</label><input value="" name="2" id="text-id1" type="text"/>'
]

{ #category : #tests }
LabeledWebViewTest >> testRenderContentOnWithFixedLabel [

	| labeledView html |

	labeledView := LabeledWebView
		displaying: 'Field'
		boundTo: (TextFieldWebView singleLineTriggeringOnChangeApplying: [ :textField |  ])
		applying: [ :label |  ].

	html := self render: labeledView.

	self
		assert: html
		equals: '<label for="text-id1">Field</label><input value="" name="2" id="text-id1" type="text"/>'
]

{ #category : #tests }
LabeledWebViewTest >> testRenderContentOnWithFixedLabelAndCommands [

	| labeledView html |

	labeledView := LabeledWebView
		displaying: 'Field'
		boundTo: (TextFieldWebView singleLineTriggeringOnChangeApplying: [ :textField |  ])
		applying: [ :label | label setTitleTo: 'Some field' ].

	html := self render: labeledView.

	self
		assert: html
		equals:
			'<label for="text-id1" title="Some field">Field</label><input value="" name="2" id="text-id1" type="text"/>'
]
