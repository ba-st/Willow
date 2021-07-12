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

{ #category : #configuring }
UnorderedListWebView >> beIdentifiable [

	^ identifierAssigner beRequired
]

{ #category : #accessing }
UnorderedListWebView >> identifierOn: aCanvas [

	^ identifierAssigner identifierOn: aCanvas
]

{ #category : #initialization }
UnorderedListWebView >> initializeApplying: aComponentCommand listing: anElementCollection applyingToEach: anElementCommand [

	elements := anElementCollection.
	commandToItem := anElementCommand.
	commandToList := aComponentCommand.
	interactionInterpreter := SingleEventInterpreterDispatcher defaultingToClick.
	identifierAssigner := IdentifierAssigner prefixedBy: 'unordered-list'
]

{ #category : #configuring }
UnorderedListWebView >> on [

	^ interactionInterpreter
]

{ #category : #rendering }
UnorderedListWebView >> renderContentOn: aCanvas [

	| list |

	list := aCanvas unorderedList.	"The order of the collaborations is relevant."
	list
		beIdentifiableUsing: identifierAssigner;
		apply: commandToList;
		interactUsing: interactionInterpreter;
		with: [ elements
				do:
					[ :anElement | aCanvas render: ( ListItemWebView itemizing: anElement containedIn: list applying: commandToItem ) ]
			]
]
