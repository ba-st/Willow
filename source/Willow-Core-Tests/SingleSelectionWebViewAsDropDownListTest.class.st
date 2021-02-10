"
A DropDownListWebViewTest is a test class for testing the behavior of DropDownListWebView
"
Class {
	#name : #SingleSelectionWebViewAsDropDownListTest,
	#superclass : #SingleSelectionWebViewBehaviorTest,
	#category : #'Willow-Core-Tests-WebViews'
}

{ #category : #support }
SingleSelectionWebViewAsDropDownListTest >> newSingleSelectionView [
	^ SingleSelectionWebView
		dropDownListApplying: [  ]
		applyingToOptions: [  ]
]

{ #category : #'tests-configuring' }
SingleSelectionWebViewAsDropDownListTest >> testBeIdentifiable [

	| dropDownList html |

	dropDownList := self newSingleSelectionView.
	dropDownList beIdentifiable.

	html := self render: dropDownList.

	self assert: html equals: '<select name="1" id="single-select-id2"></select>'
]

{ #category : #'tests-rendering' }
SingleSelectionWebViewAsDropDownListTest >> testCustomCommandForOptions [
	| dropDownList html |

	dropDownList := SingleSelectionWebView
		dropDownListApplying: [  ]
		applyingToOptions: [ :option :item | 
			item even
				ifTrue: [ option class: 'even' ]
				ifFalse: [ option class: 'odd' ] ].
	dropDownList allowAnyOf: #(1 2 3).

	html := self render: dropDownList.
	self
		assert: html
		equals:
			'<select name="1" id="id2"><option value="1" class="odd">1</option><option value="2" class="even">2</option><option value="3" class="odd">3</option></select><script type="text/javascript">$("#id2").prop("selectedIndex",-1);</script>'
]

{ #category : #'tests-configuring' }
SingleSelectionWebViewAsDropDownListTest >> testIdentifierOn [

	| dropDownList html |

	dropDownList := self newSingleSelectionView.

	html := self
		renderUsing: [ :canvas | 
			self assert: ( dropDownList identifierOn: canvas ) equals: 'single-select-id1'.
			canvas render: dropDownList
			].

	self assert: html equals: '<select name="2" id="single-select-id1"></select>'
]

{ #category : #'tests-configuring' }
SingleSelectionWebViewAsDropDownListTest >> testOn [

	| dropDownList html |

	dropDownList := self newSingleSelectionView.
	dropDownList on trigger disable.

	html := self render: dropDownList.

	self
		assert: html
		equals:
			'<select name="1" id="select-id2"></select><script type="text/javascript">$("#select-id2").change(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #'tests-rendering' }
SingleSelectionWebViewAsDropDownListTest >> testRenderContentOn [

	| dropDownList html |

	dropDownList := self newSingleSelectionView.

	html := self render: dropDownList.

	self assert: html equals: '<select name="1"></select>'
]

{ #category : #'tests-rendering' }
SingleSelectionWebViewAsDropDownListTest >> testRenderContentOnWithCommands [
	
	| dropDownList html |
	
	dropDownList := SingleSelectionWebView
		dropDownListApplying: [ :dropdown | dropdown addClass willow ]
		applyingToOptions: [  ].
	
	html := self render: dropDownList.
	self assert: html equals: '<select name="1" class="willow"></select>'
]

{ #category : #'tests-rendering' }
SingleSelectionWebViewAsDropDownListTest >> testRenderContentOnWithElements [

	| dropDownList html |

	dropDownList := self newSingleSelectionView.
	dropDownList allowAnyOf: #('One' 'Two' 'Three').
	html := self render: dropDownList.

	self
		assert: html
		equals:
			'<select name="1" id="id2"><option value="1">One</option><option value="2">Two</option><option value="3">Three</option></select><script type="text/javascript">$("#id2").prop("selectedIndex",-1);</script>'
]

{ #category : #'tests-rendering' }
SingleSelectionWebViewAsDropDownListTest >> testRenderContentOnWithElementsAndSomethingSelected [

	| dropDownList html |

	dropDownList := self newSingleSelectionView.
	dropDownList allowAnyOf: #('One' 'Two' 'Three').
	dropDownList chooseAnySatisfying: [ :element | true ] ifNone: [ self fail ].
	html := self render: dropDownList.

	self assert: html equals: '<select name="1"><option value="1" selected>One</option><option value="2">Two</option><option value="3">Three</option></select>'
]
