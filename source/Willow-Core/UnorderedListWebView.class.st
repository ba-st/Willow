"
I represent an unordered list supporting command application.
"
Class {
	#name : #UnorderedListWebView,
	#superclass : #WAPainter,
	#instVars : [
		'elements',
		'commandToItem',
		'commandToList',
		'interactionInterpreter',
		'identifierAssigner'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'instance creation' }
UnorderedListWebView class >> applying: aComponentCommand listing: anElementCollection applyingToEach: anElementCommand [

	^ self new
		initializeApplying: aComponentCommand asWebComponentCommand
		listing: anElementCollection
		applyingToEach: anElementCommand asWebComponentCommand
]

{ #category : #accessing }
UnorderedListWebView >> identifier [

	^ identifierAssigner assignedIdentifier
]

{ #category : #configuring }
UnorderedListWebView >> identifyIn: aCanvas [

	^ identifierAssigner identifyIn: aCanvas
]

{ #category : #initialization }
UnorderedListWebView >> initializeApplying: aComponentCommand listing: anElementCollection applyingToEach: anElementCommand [

	elements := anElementCollection.
	commandToItem := anElementCommand.
	commandToList := aComponentCommand.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent.
	identifierAssigner := IdentifierAssigner prefixedBy: 'unordered-list' 
]

{ #category : #configuring }
UnorderedListWebView >> onTrigger [

	^ interactionInterpreter
]

{ #category : #rendering }
UnorderedListWebView >> renderContentOn: aCanvas [

	| list |

	list := aCanvas unorderedList.
	"The order of the collaborations is relevant."
	identifierAssigner withAssignedIdentifierDo: [ :id | list id: id ].
	list
		apply: commandToList;
		interactUsing: interactionInterpreter;
		with: [ elements do: [ :anElement | aCanvas render: (ListItemWebView itemizing: anElement containedIn: list applying: commandToItem) ] ]
]
