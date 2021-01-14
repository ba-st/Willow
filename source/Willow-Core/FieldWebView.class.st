"
I 'm an abstract class representing non textual HTML5 inputs.
"
Class {
	#name : #FieldWebView,
	#superclass : #WAPainter,
	#instVars : [
		'interactionInterpreter',
		'commandToComponent',
		'interested',
		'componentBuilder',
		'contents',
		'identifierAssigner'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #private }
FieldWebView class >> changeInterpreter [

	^ EventInterpreterDispatcher defaultingToChange
]

{ #category : #private }
FieldWebView class >> forComponentBuiltUsing: aComponentBuilder withInteractionDefinedBy: anInteractionInterpreter applying: aComponentCommand [

	^ self new
		initializeForComponentBuiltUsing: aComponentBuilder
		withInteractionDefinedBy: anInteractionInterpreter
		applying: aComponentCommand asWebComponentCommand
]

{ #category : #'Container-API' }
FieldWebView >> changeContentsTo: aText [

	contents := aText.
	self notifyInterested
]

{ #category : #'Container-API' }
FieldWebView >> changeModelTo: aModel [

	^ self changeContentsTo: (self textCodec encode: aModel)
]

{ #category : #'Container-API' }
FieldWebView >> contents [

	^contents 
]

{ #category : #accessing }
FieldWebView >> identifierOn: aCanvas [

	^ identifierAssigner identifierOn: aCanvas
]

{ #category : #'private - Accessing' }
FieldWebView >> identifierPrefix [

	^ self subclassResponsibility
]

{ #category : #initialization }
FieldWebView >> initializeForComponentBuiltUsing: aComponentBuilder withInteractionDefinedBy: anInteractionInterpreter applying: aComponentCommand [

	componentBuilder := aComponentBuilder.
	interactionInterpreter := anInteractionInterpreter.
	commandToComponent := aComponentCommand.
	interested := Set new.
	identifierAssigner := IdentifierAssigner prefixedBy: self identifierPrefix.
	self changeContentsTo: ''
]

{ #category : #'Container-API' }
FieldWebView >> model [

	^ self textCodec decode: self contents
]

{ #category : #'Container-API' }
FieldWebView >> notifyChangesTo: aSupervisor [

	interested add: aSupervisor
]

{ #category : #private }
FieldWebView >> notifyInterested [

	interested do: [:anInterested | anInterested changeNotifiedBy: self]
]

{ #category : #configuring }
FieldWebView >> on [

	^ interactionInterpreter
]

{ #category : #rendering }
FieldWebView >> renderContentOn: aCanvas [

	| component |

	component := componentBuilder value: aCanvas.
	component
		value: self contents;
		callback: [ :aString | self changeContentsTo: aString ].
	component
		beIdentifiableUsing: identifierAssigner;
		apply: commandToComponent;
		interactUsing: interactionInterpreter
]

{ #category : #'private - Accessing' }
FieldWebView >> textCodec [

	^ self subclassResponsibility
]
