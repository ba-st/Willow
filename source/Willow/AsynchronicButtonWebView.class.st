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
	#category : #'Willow-WebViews'
}

{ #category : #'Instance Creation' }
AsynchronicButtonWebView class >> labeled: aLabel [

	^ self labeled: aLabel applying: [ :button |  ]
]

{ #category : #'Instance Creation' }
AsynchronicButtonWebView class >> labeled: aLabel applying: aComponentCommand [

	^ self new initializeLabeled: aLabel applying: aComponentCommand asWebComponentCommand
]

{ #category : #accessing }
AsynchronicButtonWebView >> identifier [

	^ identifierAssigner assignedIdentifier
]

{ #category : #configuring }
AsynchronicButtonWebView >> identifyIn: aCanvas [

	^ identifierAssigner identifyIn: aCanvas
]

{ #category : #initialization }
AsynchronicButtonWebView >> initializeLabeled: aLabel applying: aComponentCommand [

	label := aLabel.
	commandToComponent := aComponentCommand.
	identifierAssigner := IdentifierAssigner prefixedBy: 'button'.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent
]

{ #category : #configuring }
AsynchronicButtonWebView >> onTrigger [

	^interactionInterpreter
]

{ #category : #rendering }
AsynchronicButtonWebView >> renderContentOn: aCanvas [

	"We send bePush to the button because, by default, Seaside made it with type = submit"

	| pushButton |

	pushButton := aCanvas button.
	identifierAssigner withAssignedIdentifierDo: [ :id | pushButton id: id ].
	pushButton
		value: label;
		bePush;
		interactUsing: interactionInterpreter;
		apply: commandToComponent
]
