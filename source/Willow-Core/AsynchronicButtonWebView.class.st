"
I'm a push button used to trigger actions using AJAX
"
Class {
	#name : #AsynchronicButtonWebView,
	#superclass : #WAPainter,
	#instVars : [
		'identifierAssigner',
		'commandToComponent',
		'interactionInterpreter',
		'label'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'Instance Creation' }
AsynchronicButtonWebView class >> labeled: aLabel [

	^ self labeled: aLabel applying: [ :button |  ]
]

{ #category : #'Instance Creation' }
AsynchronicButtonWebView class >> labeled: aLabel applying: aComponentCommand [

	^ self new initializeLabeled: aLabel applying: aComponentCommand asWebComponentCommand
]

{ #category : #configuring }
AsynchronicButtonWebView >> beIdentifiable [

	^ identifierAssigner beRequired
]

{ #category : #accessing }
AsynchronicButtonWebView >> identifierOn: aCanvas [

	^ identifierAssigner identifierOn: aCanvas
]

{ #category : #initialization }
AsynchronicButtonWebView >> initializeLabeled: aLabel applying: aComponentCommand [

	label := aLabel.
	commandToComponent := aComponentCommand.
	identifierAssigner := IdentifierAssigner prefixedBy: 'button'.
	interactionInterpreter := SingleEventInterpreterDispatcher defaultingToClick
]

{ #category : #configuring }
AsynchronicButtonWebView >> on [

	^ interactionInterpreter
]

{ #category : #rendering }
AsynchronicButtonWebView >> renderContentOn: aCanvas [

	"We send bePush to the button because, by default, Seaside made it with type = submit"

	| pushButton |

	pushButton := aCanvas button.
	pushButton
		beIdentifiableUsing: identifierAssigner;
		value: label;
		bePush;
		interactUsing: interactionInterpreter;
		apply: commandToComponent
]
