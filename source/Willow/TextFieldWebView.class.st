"
I enable the user to input text information. I support single-line text box when only one line of input is required, and a multi-line text box only if more than one line of input may be required.
"
Class {
	#name : #TextFieldWebView,
	#superclass : #WAPainter,
	#instVars : [
		'interactionInterpreter',
		'commandToComponent',
		'interested',
		'componentBuilder',
		'contents',
		'identifierAssigner'
	],
	#category : #'Willow-WebViews'
}

{ #category : #private }
TextFieldWebView class >> forComponentBuiltUsing: aComponentBuilder withInteractionDefinedBy: anInteractionInterpreter applying: aComponentCommand [

	^ self new
		initializeForComponentBuiltUsing: aComponentBuilder
		withInteractionDefinedBy: anInteractionInterpreter
		applying: aComponentCommand asWebComponentCommand
]

{ #category : #'Instance Creation' }
TextFieldWebView class >> multiLineTriggeringOnChangeApplying: aComponentCommand [

	^ self
		forComponentBuiltUsing: [ :canvas | canvas textArea ]
		withInteractionDefinedBy: WebInteractionInterpreter forChangeInComponentValue
		applying: aComponentCommand
]

{ #category : #'Instance Creation' }
TextFieldWebView class >> multiLineTriggeringOnKeyUpApplying: aComponentCommand [

	^ self forComponentBuiltUsing: [ :canvas | canvas textArea ] withInteractionDefinedBy: WebInteractionInterpreter forReleaseOfKeyInComponent applying: aComponentCommand
]

{ #category : #'Instance Creation' }
TextFieldWebView class >> singleLineTriggeringOnChangeApplying: aComponentCommand [

	^ self forComponentBuiltUsing: [ :canvas | canvas textInput ] withInteractionDefinedBy: WebInteractionInterpreter forChangeInComponentValue applying: aComponentCommand
]

{ #category : #'Instance Creation' }
TextFieldWebView class >> singleLineTriggeringOnKeyUpApplying: aComponentCommand [

	^ self forComponentBuiltUsing: [ :canvas | canvas textInput ] withInteractionDefinedBy: WebInteractionInterpreter forReleaseOfKeyInComponent applying: aComponentCommand
]

{ #category : #'container-API' }
TextFieldWebView >> changeContentsTo: aText [

	contents := aText.
	self notifyInterested
]

{ #category : #'container-API' }
TextFieldWebView >> contents [

	^contents 
]

{ #category : #accessing }
TextFieldWebView >> identifier [

	^identifierAssigner assignedIdentifier
]

{ #category : #configuring }
TextFieldWebView >> identifyIn: aCanvas [

	^ identifierAssigner identifyIn: aCanvas 
]

{ #category : #initialization }
TextFieldWebView >> initializeForComponentBuiltUsing: aComponentBuilder withInteractionDefinedBy: anInteractionInterpreter applying: aComponentCommand [

	componentBuilder := aComponentBuilder.
	interactionInterpreter := anInteractionInterpreter.
	commandToComponent := aComponentCommand.
	interested := Set new.
	identifierAssigner := IdentifierAssigner prefixedBy: 'text'.
	self changeContentsTo: ''
]

{ #category : #'container-API' }
TextFieldWebView >> notifyChangesTo: aSupervisor [

	interested add: aSupervisor
]

{ #category : #private }
TextFieldWebView >> notifyInterested [

	interested do: [:anInterested | anInterested changeNotifiedBy: self]
]

{ #category : #configuring }
TextFieldWebView >> onTrigger [

	^ interactionInterpreter
]

{ #category : #rendering }
TextFieldWebView >> renderContentOn: aCanvas [

	| component |

	component := componentBuilder value: aCanvas.
	component
		value: self contents;
		callback: [ :aString | self changeContentsTo: aString ].

	identifierAssigner withAssignedIdentifierDo: [ :id | component id: id ].
	commandToComponent applyTo: component on: aCanvas.
	interactionInterpreter applyTo: component on: aCanvas
]
