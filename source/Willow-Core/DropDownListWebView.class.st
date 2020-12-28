"
I'm a drop-down list that allows the user to choose one value from a list. 

When a drop-down list is inactive, it displays a single value. When activated, it displays (drops down) a list of values, from which the user may select one. When the user selects a new value, the control reverts to its inactive state, displaying the selected value.

I implement the Single Selection API
"
Class {
	#name : #DropDownListWebView,
	#superclass : #SingleSelectionWebViewBehavior,
	#instVars : [
		'interactionInterpreter',
		'commandToComponent',
		'identifierAssigner'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'instance creation' }
DropDownListWebView class >> applying: aCommandToComponent [

	^ self new initializeApplying: aCommandToComponent asWebComponentCommand
]

{ #category : #private }
DropDownListWebView >> configure: select unselectingAllOn: aCanvas [

	^ availableElements ifNotEmpty: [ select apply: DeselectAllOptionsCommand new ]
]

{ #category : #accessing }
DropDownListWebView >> identifier [

	^ identifierAssigner assignedIdentifier
]

{ #category : #configuring }
DropDownListWebView >> identifyIn: aCanvas [

	^ identifierAssigner identifyIn: aCanvas
]

{ #category : #initialization }
DropDownListWebView >> initializeApplying: aCommandToComponent [

	commandToComponent := aCommandToComponent.
	interactionInterpreter := EventInterpreterDispatcher defaultingToChange.
	identifierAssigner := IdentifierAssigner prefixedBy: 'drop-down-list'
]

{ #category : #configuring }
DropDownListWebView >> on [

	^ interactionInterpreter
]

{ #category : #rendering }
DropDownListWebView >> renderContentOn: aCanvas [

	| select |

	select := aCanvas select.
	select list: availableElements.
	select callback: [ :element | self choose: element ].
	identifierAssigner withAssignedIdentifierDo: [ :id | select id: id ].
	chosenElementOptional withContentDo: [ :chosenElement | select selected: chosenElement ] ifUnused: [ self configure: select unselectingAllOn: aCanvas ].
	select
		apply: commandToComponent;
		interactUsing: interactionInterpreter
]
