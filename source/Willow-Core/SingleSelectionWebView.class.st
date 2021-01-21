Class {
	#name : #SingleSelectionWebView,
	#superclass : #SingleSelectionWebViewBehavior,
	#instVars : [
		'commandToComponent',
		'interactionInterpreter',
		'identifierAssigner',
		'optionCommand'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'instance creation' }
SingleSelectionWebView class >> dropDownListApplying: aComponentCommand [

	^ self prefixedBy: 'drop-down-list' applying: aComponentCommand
]

{ #category : #'instance creation' }
SingleSelectionWebView class >> listBoxDisplayingAtOnce: aNumberOfElements [

	^ self
		listBoxDisplayingAtOnce: aNumberOfElements
		applying: [ :listBox |  ]
]

{ #category : #'instance creation' }
SingleSelectionWebView class >> listBoxDisplayingAtOnce: aNumberOfElements applying: aCommandComponent [

	AssertionChecker
		enforce: [ aNumberOfElements > 1 ]
		because: 'A list box must display more than one element'.

	^ self
		prefixedBy: 'list-box'
		applying:
			(SetComponentSizeCommand setting: aNumberOfElements)
				+ aCommandComponent
]

{ #category : #'private - instance creation' }
SingleSelectionWebView class >> prefixedBy: aPrefix applying: aComponentCommand [

	^ self new
		initializePrefixedBy: aPrefix
		applying: aComponentCommand
]

{ #category : #initialization }
SingleSelectionWebView >> applyToEachOption: aCommand [

	optionCommand := aCommand
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
SingleSelectionWebView >> initializePrefixedBy: aPrefix applying: aCommandToComponent [
	
	commandToComponent := aCommandToComponent.
	interactionInterpreter := EventInterpreterDispatcher defaultingToChange.
	identifierAssigner := IdentifierAssigner prefixedBy: aPrefix.
	optionCommand := [:option :item | ]
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
		apply: commandToComponent. 
	
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
			optionCommand value: option value: anObject.
			option
				selected: (aWASelectTag isSelected: anObject);
				disabled: (aWASelectTag isEnabled: anObject) not;
				with: (aWASelectTag labelForOption: anObject) ]
]
