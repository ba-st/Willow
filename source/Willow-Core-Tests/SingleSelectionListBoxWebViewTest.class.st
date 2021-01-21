"
A SingleSelectionListBoxWebViewTest is a test class for testing the behavior of SingleSelectionListBoxWebView
"
Class {
	#name : #SingleSelectionListBoxWebViewTest,
	#superclass : #SingleSelectionWebViewTest,
	#category : #'Willow-Core-Tests-WebViews'
}

{ #category : #'instance creation' }
SingleSelectionListBoxWebViewTest >> newSingleSelectionView [

	^ SingleSelectionListBoxWebView displayingAtOnce: 5
]

{ #category : #tests }
SingleSelectionListBoxWebViewTest >> testDisplayingAtOnce [

	self
		should: [ SingleSelectionListBoxWebView displayingAtOnce: 1 ] raise: AssertionFailed;
		should: [ SingleSelectionListBoxWebView displayingAtOnce: 0 ] raise: AssertionFailed;
		should: [ SingleSelectionListBoxWebView displayingAtOnce: -51 ] raise: AssertionFailed
]

{ #category : #tests }
SingleSelectionListBoxWebViewTest >> testIdentifierOn [

	| listBox html |

	listBox := self newSingleSelectionView.

	html := self
		renderUsing: [ :canvas | 
			self assert: ( listBox identifierOn: canvas ) equals: 'list-box-id1'.
			canvas render: listBox
			].

	self assert: html equals: '<select name="2" id="list-box-id1" size="5"></select>'
]

{ #category : #tests }
SingleSelectionListBoxWebViewTest >> testOn [

	| listBox html |

	listBox := self newSingleSelectionView.
	listBox on trigger disable.

	html := self render: listBox.

	self
		assert: html
		equals:
			'<select name="1" id="select-id2" size="5"></select><script type="text/javascript">$("#select-id2").change(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #'tests-rendering' }
SingleSelectionListBoxWebViewTest >> testRenderContentOn [

	| listBox html |

	listBox := self newSingleSelectionView.

	html := self render: listBox.

	self assert: html equals: '<select name="1" size="5"></select>'
]

{ #category : #'tests-rendering' }
SingleSelectionListBoxWebViewTest >> testRenderContentOnWithCommands [

	| listBox html |

	listBox := SingleSelectionListBoxWebView displayingAtOnce: 10 applying: [ :theListBox | theListBox addClass willow ].
	html := self render: listBox.

	self assert: html equals: '<select name="1" size="10" class="willow"></select>'
]

{ #category : #'tests-rendering' }
SingleSelectionListBoxWebViewTest >> testRenderContentOnWithElements [

	| listBox html |

	listBox := self newSingleSelectionView.
	listBox allowAnyOf: #('One' 'Two' 'Three').
	html := self render: listBox.

	self
		assert: html
		equals:
			'<select name="1" id="id2" size="5"><option value="1">One</option><option value="2">Two</option><option value="3">Three</option></select><script type="text/javascript">$("#id2").prop("selectedIndex",-1);</script>'
]

{ #category : #'tests-rendering' }
SingleSelectionListBoxWebViewTest >> testRenderContentOnWithElementsAndSomethingSelected [

	| listBox html |

	listBox := self newSingleSelectionView.
	listBox allowAnyOf: #('One' 'Two' 'Three').
	listBox chooseAnySatisfying: [ :element | true ] ifNone: [ self fail ].
	html := self render: listBox.

	self
		assert: html
		equals:
			'<select name="1" size="5"><option value="1" selected>One</option><option value="2">Two</option><option value="3">Three</option></select>'
]
