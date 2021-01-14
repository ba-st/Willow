"
I represent an image that can optionally be interactive.
"
Class {
	#name : #ImageWebView,
	#superclass : #WAPainter,
	#instVars : [
		'interactionInterpreter',
		'commandToComponent',
		'imageLocation'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'instance creation' }
ImageWebView class >> locatedAt: aLocation applying: aComponentCommand [

	^ self new initializeLocatedAt: aLocation applying: aComponentCommand asWebComponentCommand 
]

{ #category : #'instance creation' }
ImageWebView class >> ofType: aMimeType base64EncodedAs: imageInBase64 applying: aComponentCommand [

	^ self locatedAt: ('data:<1s>;base64,<2s>' expandMacrosWith: aMimeType greaseString with: imageInBase64) applying: aComponentCommand
]

{ #category : #initialization }
ImageWebView >> initializeLocatedAt: aLocation applying: aComponentCommand [

	imageLocation := aLocation.
	commandToComponent := aComponentCommand.
	interactionInterpreter := EventInterpreterDispatcher defaultingToClick
]

{ #category : #configuring }
ImageWebView >> on [

	^ interactionInterpreter
]

{ #category : #rendering }
ImageWebView >> renderContentOn: aCanvas [

	aCanvas image
		url: imageLocation;
		apply: commandToComponent;
		interactUsing: interactionInterpreter
]
