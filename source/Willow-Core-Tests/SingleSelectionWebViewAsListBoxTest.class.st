"
A SingleSelectionListBoxWebViewTest is a test class for testing the behavior of SingleSelectionListBoxWebView
"
Class {
	#name : #SingleSelectionWebViewAsListBoxTest,
	#superclass : #SingleSelectionWebViewTest,
	#category : #'Willow-Core-Tests-WebViews'
}

{ #category : #'instance creation' }
SingleSelectionWebViewAsListBoxTest >> newSingleSelectionView [

	^ SingleSelectionWebView listBoxDisplayingAtOnce: 5
]

{ #category : #tests }
SingleSelectionWebViewAsListBoxTest >> testBeIdentifiable [

	| listBox html |

	listBox := self newSingleSelectionView.
	listBox beIdentifiable.

	html := self render: listBox.

	self assert: html equals: '<select name="1" id="single-select-id2" size="5"></select>'
]

{ #category : #'tests-rendering' }
SingleSelectionWebViewAsListBoxTest >> testCustomCommandForOptions [
	| dropDownList html |
	
	dropDownList := SingleSelectionWebView
		listBoxDisplayingAtOnce: 5
		applying: [  ]
		applyingToOptions: [ :option :item | 
			item even
				ifTrue: [ option class: 'even' ]
				ifFalse: [ option class: 'odd' ] ].
	dropDownList allowAnyOf: #(1 2 3).

	html := self render: dropDownList.
	self
		assert: html
		equals:
			'<select name="1" id="id2" size="5"><option value="1" class="odd">1</option><option value="2" class="even">2</option><option value="3" class="odd">3</option></select><script type="text/javascript">$("#id2").prop("selectedIndex",-1);</script>'
]

{ #category : #tests }
SingleSelectionWebViewAsListBoxTest >> testDisplayingAtOnce [

	self
		should: [ SingleSelectionWebView listBoxDisplayingAtOnce: 1 ] raise: AssertionFailed;
		should: [ SingleSelectionWebView listBoxDisplayingAtOnce: 0 ] raise: AssertionFailed;
		should: [ SingleSelectionWebView listBoxDisplayingAtOnce: -51 ] raise: AssertionFailed
]

{ #category : #tests }
SingleSelectionWebViewAsListBoxTest >> testIdentifierOn [

	| listBox html |

	listBox := self newSingleSelectionView.

	html := self
		renderUsing: [ :canvas | 
			self assert: ( listBox identifierOn: canvas ) equals: 'single-select-id1'.
			canvas render: listBox
			].

	self assert: html equals: '<select name="2" id="single-select-id1" size="5"></select>'
]

{ #category : #tests }
SingleSelectionWebViewAsListBoxTest >> testOn [

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
SingleSelectionWebViewAsListBoxTest >> testRenderContentOn [

	| listBox html |

	listBox := self newSingleSelectionView.

	html := self render: listBox.

	self assert: html equals: '<select name="1" size="5"></select>'
]

{ #category : #'tests-rendering' }
SingleSelectionWebViewAsListBoxTest >> testRenderContentOnWithCommands [
	| listBox html |

	listBox := SingleSelectionWebView
		listBoxDisplayingAtOnce: 10
		applying: [ :theListBox | theListBox addClass willow ]
		applyingToOptions: [  ].
		
	html := self render: listBox.
	self
		assert: html
		equals: '<select name="1" size="10" class="willow"></select>'
]

{ #category : #'tests-rendering' }
SingleSelectionWebViewAsListBoxTest >> testRenderContentOnWithElements [

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
SingleSelectionWebViewAsListBoxTest >> testRenderContentOnWithElementsAndSomethingSelected [

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
