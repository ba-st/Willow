"
A CheckboxWebViewTest is a test class for testing the behavior of CheckboxWebView
"
Class {
	#name : #CheckboxWebViewTest,
	#superclass : #BinaryChoiceWebViewTest,
	#category : #'Willow-Core-Tests-WebViews'
}

{ #category : #'instance creation' }
CheckboxWebViewTest >> newBinaryChoiceView [

	^ CheckboxWebView onModel: true offModel: false
]

{ #category : #'tests-rendering' }
CheckboxWebViewTest >> testIdentifyIn [

	| html checkbox |

	checkbox := self newBinaryChoiceView.
	html := self
		renderUsing: [ :canvas | 
			self assert: ( checkbox identifierOn: canvas ) equals: 'checkbox-id1'.
			canvas render: checkbox
			].

	self
		assert: html
		equals: '<input checked name="2" id="checkbox-id1" type="checkbox"/><input name="3" type="hidden"/>'
]

{ #category : #'tests-configuring' }
CheckboxWebViewTest >> testOn [

	| html binaryChoiceView |

	binaryChoiceView := self newBinaryChoiceView.
	binaryChoiceView on trigger disable.
	html := self render: binaryChoiceView.

	self
		assert: html
		equals:
			'<input checked name="1" id="input-id2" type="checkbox"/><input name="3" type="hidden"/><script type="text/javascript">$("#input-id2").click(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #'tests-rendering' }
CheckboxWebViewTest >> testRenderingAfterUpdatingModel [

	| html checkbox |

	checkbox := CheckboxWebView onModel: 1 offModel: 2 applying: [ :theCheckbox | theCheckbox addClass willow ].

	checkbox selectOffModel.
	html := self render: checkbox.
	self assert: html equals: '<input class="willow" name="1" type="checkbox"/><input name="2" type="hidden"/>'.

	checkbox selectOnModel.
	html := self render: checkbox.
	self assert: html equals: '<input class="willow" checked name="1" type="checkbox"/><input name="2" type="hidden"/>'
]

{ #category : #'tests-rendering' }
CheckboxWebViewTest >> testRenderingWithLabel [

	| html checkbox |

	checkbox := CheckboxWebView
		labeled: 'Enable network'
		onModel: 1
		offModel: 2
		applying: [ :theCheckbox | theCheckbox addClass willow ].

	html := self render: checkbox.

	self assert: html equals: '<input class="willow" checked name="1" id="checkbox-id2" type="checkbox"/><input name="3" type="hidden"/><label for="checkbox-id2">Enable network</label>'
]

{ #category : #'tests-rendering' }
CheckboxWebViewTest >> testWithNonBooleanModels [

	| html checkbox |

	checkbox := CheckboxWebView onModel: 1 offModel: 2.

	html := self render: checkbox.

	self
		assert: html equals: '<input checked name="1" type="checkbox"/><input name="2" type="hidden"/>';
		assert: checkbox currentSelection equals: 1.

	checkbox toggleCurrentSelection.

	html := self render: checkbox.

	self
		assert: html equals: '<input name="1" type="checkbox"/><input name="2" type="hidden"/>';
		assert: checkbox currentSelection equals: 2
]
