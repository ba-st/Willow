"
I'm a list box, that allows the user to select one or more items from a list contained within a static, multiple line text box. The user clicks inside the box on an item to select it.
"
Class {
	#name : #MultipleSelectionListBoxWebView,
	#superclass : #WAPainter,
	#instVars : [
		'availableElements',
		'chosenElements',
		'interested',
		'interactionInterpreter',
		'commandToComponent',
		'identifierAssigner'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'instance creation' }
MultipleSelectionListBoxWebView class >> applying: aCommandToComponent [

	^self new initializeApplying: aCommandToComponent asWebComponentCommand 
]

{ #category : #'instance creation' }
MultipleSelectionListBoxWebView class >> displayingAtOnce: aNumberOfElements applying: aCommandComponent [

	AssertionChecker enforce: [ aNumberOfElements > 1 ] because: 'A list box must display more than one element'.

	^ self applying: (SetComponentSizeCommand setting: aNumberOfElements) + aCommandComponent
]

{ #category : #'Multiple Selection-API' }
MultipleSelectionListBoxWebView >> allowAnyOf: anElementCollection [

	availableElements := anElementCollection.
	self chooseAllIn: chosenElements
]

{ #category : #'Multiple Selection-API' }
MultipleSelectionListBoxWebView >> allowsAnySatisfying: aMatchBlock [

	^availableElements anySatisfy: aMatchBlock
]

{ #category : #'Multiple Selection-API' }
MultipleSelectionListBoxWebView >> chooseAll [

	chosenElements := availableElements.
	self notifyInterested
]

{ #category : #'Multiple Selection-API' }
MultipleSelectionListBoxWebView >> chooseAllIn: anElementCollection [

	self chooseAllMatching: [ :available | anElementCollection includes: available ]
]

{ #category : #'Multiple Selection-API' }
MultipleSelectionListBoxWebView >> chooseAllMatching: aMonadycBlock [

	chosenElements := availableElements select: aMonadycBlock.
	self notifyInterested
]

{ #category : #'Multiple Selection-API' }
MultipleSelectionListBoxWebView >> currentSelection [

	^chosenElements 
]

{ #category : #'Multiple Selection-API' }
MultipleSelectionListBoxWebView >> disallowAll [

	self allowAnyOf: #()
]

{ #category : #accessing }
MultipleSelectionListBoxWebView >> identifier [

	^identifierAssigner assignedIdentifier
]

{ #category : #configuring }
MultipleSelectionListBoxWebView >> identifyIn: aCanvas [

	^ identifierAssigner identifyIn: aCanvas
]

{ #category : #initialization }
MultipleSelectionListBoxWebView >> initializeApplying: aCommandToComponent [

	interested := Set new.
	commandToComponent := aCommandToComponent.
	interactionInterpreter := WebInteractionInterpreter
		forChangeInHiddenInputDependentComponentValue.
	identifierAssigner := IdentifierAssigner prefixedBy: 'list-box'.
	self disallowAll
]

{ #category : #'Multiple Selection-API' }
MultipleSelectionListBoxWebView >> notifyChangesTo: aSupervisor [

	interested add: aSupervisor
]

{ #category : #private }
MultipleSelectionListBoxWebView >> notifyInterested [

	interested do: [ :anInterested | anInterested changeNotifiedBy: self ]
]

{ #category : #configuring }
MultipleSelectionListBoxWebView >> onTrigger [

	^ interactionInterpreter
]

{ #category : #rendering }
MultipleSelectionListBoxWebView >> renderContentOn: aCanvas [

	| select |

	select := aCanvas multiSelect.
	select
		list: availableElements;
		callback: [ :elements | self chooseAllIn: elements ];
		selected: chosenElements.
	identifierAssigner withAssignedIdentifierDo: [ :id | select id: id ].
	select
		interactUsing: interactionInterpreter;
		apply: commandToComponent
]
