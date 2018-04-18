"
I'm a list box, that allows the user to select one item from a list contained within a static, multiple line text box. The user clicks inside the box on an item to select it.
"
Class {
	#name : #SingleSelectionListBoxWebView,
	#superclass : #SingleSelectionWebViewBehavior,
	#instVars : [
		'interactionInterpreter',
		'commandToComponent',
		'identifierAssigner'
	],
	#category : 'Willow-WebViews'
}

{ #category : #'instance creation' }
SingleSelectionListBoxWebView class >> displayingAtOnce: aNumberOfElements [

	^ self displayingAtOnce: aNumberOfElements applying: [ :listBox |  ]
]

{ #category : #'instance creation' }
SingleSelectionListBoxWebView class >> displayingAtOnce: aNumberOfElements applying: aCommandComponent [

	AssertionChecker enforce: [ aNumberOfElements > 1 ] because: 'A list box must display more than one element'.

	^ self new initializeApplying: (SetComponentSizeCommand setting: aNumberOfElements) + aCommandComponent
]

{ #category : #private }
SingleSelectionListBoxWebView >> configure: select unselectingAllOn: aCanvas [

	^ availableElements ifNotEmpty: [ DeselectAllOptionsCommand new applyTo: select on: aCanvas ]
]

{ #category : #accessing }
SingleSelectionListBoxWebView >> identifier [

	^ identifierAssigner assignedIdentifier
]

{ #category : #configuring }
SingleSelectionListBoxWebView >> identifyIn: aCanvas [

	^ identifierAssigner identifyIn: aCanvas 
]

{ #category : #initialization }
SingleSelectionListBoxWebView >> initializeApplying: aCommandToComponent [

	commandToComponent := aCommandToComponent.
	interactionInterpreter := WebInteractionInterpreter forChangeInComponentValue.
	identifierAssigner := IdentifierAssigner prefixedBy: 'list-box'
]

{ #category : #configuring }
SingleSelectionListBoxWebView >> onTrigger [

	^ interactionInterpreter
]

{ #category : #rendering }
SingleSelectionListBoxWebView >> renderContentOn: aCanvas [

	| select |

	select := aCanvas select.
	select list: availableElements.
	select callback: [ :element | self choose: element ].
	identifierAssigner withAssignedIdentifierDo: [ :id | select id: id ].
	chosenElementOptional withContentDo: [ :chosenElement | select selected: chosenElement ] ifUnused: [ self configure: select unselectingAllOn: aCanvas ].
	interactionInterpreter applyTo: select on: aCanvas.
	commandToComponent applyTo: select on: aCanvas
]
