Class {
	#name : #SingleSelectionWebView,
	#superclass : #SingleSelectionWebViewBehavior,
	#instVars : [
		'interactionInterpreter',
		'identifierAssigner',
		'optionCommand',
		'selectCommand'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'private - instance creation' }
SingleSelectionWebView class >> applyingToSelect: aSelectCommand applyingToOptions: anOptionCommand [

	^ self new initializeApplyingToSelect: aSelectCommand applyingToOptions: anOptionCommand
]

{ #category : #'instance creation' }
SingleSelectionWebView class >> dropDownListApplying: aSelectCommand applyingToOptions: anOptionCommand [ 

	^ self applyingToSelect: aSelectCommand applyingToOptions: anOptionCommand 
]

{ #category : #'instance creation' }
SingleSelectionWebView class >> listBoxDisplayingAtOnce: aNumberOfElements [
	
	^ self
		listBoxDisplayingAtOnce: aNumberOfElements
		applying: [ :listBox |  ]
		applyingToOptions: [  ]
]

{ #category : #'instance creation' }
SingleSelectionWebView class >> listBoxDisplayingAtOnce: aNumberOfElements applying: aSelectCommand applyingToOptions: anOptionCommand [
	AssertionChecker
		enforce: [ aNumberOfElements > 1 ]
		because: 'A list box must display more than one element'.

	^ self
		applyingToSelect:
			(SetComponentSizeCommand setting: aNumberOfElements) + aSelectCommand
		applyingToOptions: anOptionCommand
]

{ #category : #private }
SingleSelectionWebView >> configure: select unselectingAllOn: aCanvas [

	^ availableElements ifNotEmpty: [ select apply: DeselectAllOptionsCommand new ]
]

{ #category : #accessing }
SingleSelectionWebView >> identifierOn: aCanvas [

	^ identifierAssigner identifierOn: aCanvas
]

{ #category : #initialization }
SingleSelectionWebView >> initializeApplyingToSelect: aSelectCommand applyingToOptions: anOptionCommand [
	
	selectCommand := aSelectCommand.
	optionCommand := anOptionCommand.
	interactionInterpreter := EventInterpreterDispatcher defaultingToChange.
	identifierAssigner := IdentifierAssigner prefixedBy: 'single-select'.

]

{ #category : #configuring }
SingleSelectionWebView >> on [

	^ interactionInterpreter
]

{ #category : #rendering }
SingleSelectionWebView >> renderContentOn: aCanvas [

	| select |

	select := aCanvas select.
	select callback: [ :element | self choose: element ].
	chosenElementOptional
		withContentDo: [ :chosenElement | select selected: chosenElement ]
		ifUnused: [ self configure: select unselectingAllOn: aCanvas ].
	select
		beIdentifiableUsing: identifierAssigner;
		interactUsing: interactionInterpreter;
		apply: selectCommand. 
	
	select with: [ self renderOptionsFor: select on: aCanvas ]
]

{ #category : #rendering }
SingleSelectionWebView >> renderOptionsFor: aWASelectTag on: aCanvas [

	availableElements
		do: [ :anObject | 
			| option |
			option := aCanvas option.
			aWASelectTag hasCallback
				ifTrue: [ option value: (aWASelectTag valueFor: anObject) ].
			optionCommand cull: option cull: anObject.
			option
				selected: (aWASelectTag isSelected: anObject);
				disabled: (aWASelectTag isEnabled: anObject) not;
				with: (aWASelectTag labelForOption: anObject) ]
]
