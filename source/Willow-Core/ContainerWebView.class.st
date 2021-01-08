Class {
	#name : #ContainerWebView,
	#superclass : #WAPainter,
	#instVars : [
		'interactionInterpreter',
		'commandToComponent',
		'identifierAssigner',
		'renderableContent',
		'containerBuilder'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'Instance Creation' }
ContainerWebView class >> wrapping: aRenderable intoElementBuiltUsing: anElementBuilder applying: aComponentCommand [

	^ self new
		initializeWrapping: aRenderable
		intoElementBuiltUsing: anElementBuilder
		applying: aComponentCommand asWebComponentCommand
]

{ #category : #configuring }
ContainerWebView >> beIdentifiable [

	identifierAssigner beRequired
]

{ #category : #accessing }
ContainerWebView >> identifierOn: aCanvas [

	^ identifierAssigner identifierOn: aCanvas
]

{ #category : #initialization }
ContainerWebView >> initializeWrapping: aRenderable intoElementBuiltUsing: anElementBuilder applying: aComponentCommand [

	containerBuilder := anElementBuilder.
	renderableContent := aRenderable.
	commandToComponent := aComponentCommand.
	identifierAssigner := IdentifierAssigner prefixedBy: 'container'.
	interactionInterpreter := EventInterpreterDispatcher defaultingToClick
]

{ #category : #configuring }
ContainerWebView >> on [

	self beIdentifiable.
	^ interactionInterpreter
]

{ #category : #rendering }
ContainerWebView >> renderContentOn: aCanvas [

	( containerBuilder cull: aCanvas )
		beIdentifiableUsing: identifierAssigner;
		interactUsing: interactionInterpreter;
		with: renderableContent applying: commandToComponent
]

{ #category : #accessing }
ContainerWebView >> renderableContent [

	^ renderableContent
]
