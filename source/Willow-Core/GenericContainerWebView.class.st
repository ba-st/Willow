"
I'm a generic container suitable for all the non-phrasing content
"
Class {
	#name : #GenericContainerWebView,
	#superclass : #WAPainter,
	#instVars : [
		'contentProvider',
		'interactionInterpreter',
		'commandToComponent'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'Instance Creation' }
GenericContainerWebView class >> obtainingContentFrom: aContentProvider [

	^ self obtainingContentFrom: aContentProvider applying: [ :container |  ]
]

{ #category : #'Instance Creation' }
GenericContainerWebView class >> obtainingContentFrom: aContentProvider applying: aComponentCommand [

	^ self new initializeObtainingContentFrom: aContentProvider applying: aComponentCommand asWebComponentCommand 
]

{ #category : #'Instance Creation' }
GenericContainerWebView class >> wrapping: aRenderable applying: aComponentCommand [

	^ self obtainingContentFrom: [ aRenderable ] applying: aComponentCommand
]

{ #category : #initialization }
GenericContainerWebView >> initializeObtainingContentFrom: aContentProvider applying: aComponentCommand [

	contentProvider := aContentProvider.
	commandToComponent := aComponentCommand.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent 
]

{ #category : #configuring }
GenericContainerWebView >> onTrigger [

	^interactionInterpreter 
]

{ #category : #rendering }
GenericContainerWebView >> renderContentOn: aCanvas [

	aCanvas div
		interactUsing: interactionInterpreter;
		with: contentProvider value applying: commandToComponent
]
