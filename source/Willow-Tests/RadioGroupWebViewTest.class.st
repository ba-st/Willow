"
A RadioGroupWebViewTest is a test class for testing the behavior of RadioGroupWebView
"
Class {
	#name : #RadioGroupWebViewTest,
	#superclass : #SingleSelectionWebViewTest,
	#category : 'Willow-Tests-WebViews'
}

{ #category : #support }
RadioGroupWebViewTest >> newSingleSelectionView [

	^ RadioGroupWebView new
]

{ #category : #'tests-rendering' }
RadioGroupWebViewTest >> testOnTrigger [

	| radioGroup html |

	radioGroup := self newSingleSelectionView.
	radioGroup allowAnyOf: #('Buenos Aires' 'CABA').
	radioGroup onTrigger disable.
	html := self render: radioGroup.

	self
		assert: html
		equals:
			'<label for="radio-button-id2"><input name="1" id="radio-button-id2" value="1" type="radio"/>Buenos Aires</label><label for="radio-button-id3"><input name="1" id="radio-button-id3" value="2" type="radio"/>CABA</label><script type="text/javascript">$("#radio-button-id2").change(function(event){$(this).prop("disabled",true)});$("#radio-button-id3").change(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #'tests-rendering' }
RadioGroupWebViewTest >> testRenderContentOnWithElements [

	| radioGroup html |

	radioGroup := self newSingleSelectionView.
	radioGroup allowAnyOf: #('Buenos Aires' 'CABA').
	html := self render: radioGroup.

	self
		assert: html
		equals:
			'<label for="radio-button-id2"><input name="1" id="radio-button-id2" value="1" type="radio"/>Buenos Aires</label><label for="radio-button-id3"><input name="1" id="radio-button-id3" value="2" type="radio"/>CABA</label>'
]

{ #category : #'tests-rendering' }
RadioGroupWebViewTest >> testRenderContentOnWithElementsAndSomethingSelected [

	| radioGroup html |

	radioGroup := self newSingleSelectionView.
	radioGroup allowAnyOf: #('Buenos Aires' 'CABA').
	radioGroup
		chooseAnySatisfying: [ :place | true ]
		ifNone: [ self fail ].

	html := self render: radioGroup.

	self
		assert: html
		equals:
			'<label for="radio-button-id2"><input name="1" id="radio-button-id2" checked="checked" value="1" type="radio"/>Buenos Aires</label><label for="radio-button-id3"><input name="1" id="radio-button-id3" value="2" type="radio"/>CABA</label>'.

	radioGroup
		chooseAnySatisfying: [ :place | place beginsWith: 'C' ]
		ifNone: [ self fail ].

	html := self render: radioGroup.

	self
		assert: html
		equals:
			'<label for="radio-button-id2"><input name="1" id="radio-button-id2" value="1" type="radio"/>Buenos Aires</label><label for="radio-button-id3"><input name="1" id="radio-button-id3" checked="checked" value="2" type="radio"/>CABA</label>'
]

{ #category : #'tests-rendering' }
RadioGroupWebViewTest >> testRenderingWhenEmptyDoesNotProduceHTMLContent [

	| radioGroup html |

	radioGroup := self newSingleSelectionView.
	html := self render: radioGroup.

	self assert: html isEmpty
]

{ #category : #'tests-rendering' }
RadioGroupWebViewTest >> testRenderingWithApplying [

	| radioGroup html |

	radioGroup := RadioGroupWebView 
		renderingWith:  [ :element | element asUppercase ] 
		applyingToLabel: [ :group | group addClass disabledComponent ] 
		applyingToInput: [ :group | group addClass disabledComponent ].

	radioGroup allowAnyOf: #($a $b).
	html := self render: radioGroup.

	self
		assert: html
		equals:
			'<label for="radio-button-id2" class="willow-disabled-component"><input name="1" id="radio-button-id2" class="willow-disabled-component" value="1" type="radio"/>A</label><label for="radio-button-id3" class="willow-disabled-component"><input name="1" id="radio-button-id3" class="willow-disabled-component" value="2" type="radio"/>B</label>'
]
