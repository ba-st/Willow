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
	#category : 'Willow-WebViews'
}

{ #category : #'instance creation' }
ImageWebView class >> locatedAt: aLocation applying: aComponentCommand [

	^ self new initializeLocatedAt: aLocation applying: aComponentCommand asWebComponentCommand 
]

{ #category : #'instance creation' }
ImageWebView class >> ofType: aMimeType base64EncodedAs: imageInBase64 applying: aComponentCommand [

	^ self locatedAt: ('data:<1s>;base64,<2s>' expandMacrosWith: aMimeType greaseString with: imageInBase64) applying: aComponentCommand
]

{ #category : #'initialize-release' }
ImageWebView >> initializeLocatedAt: aLocation applying: aComponentCommand [

	imageLocation := aLocation.
	commandToComponent := aComponentCommand.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent
]

{ #category : #configuring }
ImageWebView >> onTrigger [

	^interactionInterpreter
]

{ #category : #rendering }
ImageWebView >> renderContentOn: aCanvas [

	| component |
	component := self renderImageOn: aCanvas.
	interactionInterpreter applyTo: component on: aCanvas
]

{ #category : #rendering }
ImageWebView >> renderImageOn: aCanvas [

	| component |

	component := aCanvas image.
	component url: imageLocation.
	commandToComponent applyTo: component on: aCanvas.
	^ component
]
