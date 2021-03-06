"
I'm an anchor acting as a push button, capable of triggering actions by AJAX
"
Class {
	#name : #LinkWebView,
	#superclass : #WAPainter,
	#instVars : [
		'commandToComponent',
		'interactionInterpreter',
		'label'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'instance creation' }
LinkWebView class >> asynchronicLabeled: aRenderable applying: aComponentCommand [

	| linkView |

	linkView := self labeled: aRenderable applying: aComponentCommand.
	linkView on trigger userAgentDo: [ :canvas | canvas jQuery event preventDefault ].
	^ linkView
]

{ #category : #'private - instance creation' }
LinkWebView class >> labeled: aLabel applying: aComponentCommand [

	^ self new initializeLabeled: aLabel applying: aComponentCommand asWebComponentCommand
]

{ #category : #'instance creation' }
LinkWebView class >> synchronicLabeled: aRenderable applying: aComponentCommand [

	"We send the private message to ensure that all instances are declared as either synchronic or asynchronic"
	^ self labeled: aRenderable applying: aComponentCommand
]

{ #category : #initialization }
LinkWebView >> initializeLabeled: aLabel applying: aComponentCommand [

	label := aLabel.
	commandToComponent := aComponentCommand.
	interactionInterpreter := EventInterpreterDispatcher defaultingToClick
]

{ #category : #configuring }
LinkWebView >> on [

	^ interactionInterpreter
]

{ #category : #rendering }
LinkWebView >> renderContentOn: aCanvas [

	aCanvas anchor
		interactUsing: interactionInterpreter;
		with: label applying: commandToComponent
]
