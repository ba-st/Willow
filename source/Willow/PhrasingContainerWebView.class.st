"
I represent a generic container for phrasing content, which don't inherently represent anything. 
I can be used to group elements for styling purposes (using the class or id attributes), or because they share attribute values, such as lang. 
I should be used only when no other semantic element is appropriate.
"
Class {
	#name : #PhrasingContainerWebView,
	#superclass : #WAPainter,
	#instVars : [
		'phrasingContentProvider',
		'interactionInterpreter',
		'commandToComponent'
	],
	#category : #'Willow-WebViews'
}

{ #category : #'Instance Creation' }
PhrasingContainerWebView class >> obtainingContentFrom: aContentProvider [

	^ self obtainingContentFrom: aContentProvider applying: [ :container |  ]
]

{ #category : #'Instance Creation' }
PhrasingContainerWebView class >> obtainingContentFrom: aContentProvider applying: aComponentCommand [

	^ self new initializeObtainingContentFrom: aContentProvider applying: aComponentCommand asWebComponentCommand 
]

{ #category : #'Instance Creation' }
PhrasingContainerWebView class >> wrapping: aString applying: aComponentCommand [

	^ self obtainingContentFrom: [ aString ] applying: aComponentCommand
]

{ #category : #initialization }
PhrasingContainerWebView >> initializeObtainingContentFrom: aContentProvider applying: aComponentCommand [

	phrasingContentProvider := aContentProvider.
	commandToComponent := aComponentCommand.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent
]

{ #category : #configuring }
PhrasingContainerWebView >> onTrigger [

	^interactionInterpreter
]

{ #category : #rendering }
PhrasingContainerWebView >> renderContentOn: aCanvas [

	aCanvas span
		apply: interactionInterpreter;
		with: phrasingContentProvider value applying: commandToComponent
]
