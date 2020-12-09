"
I'm a web view guaranteed to have an id and used usually to swap my child content
"
Class {
	#name : #IdentifiedWebView,
	#superclass : #WAPainter,
	#instVars : [
		'view',
		'componentBuilder',
		'commandToComponent',
		'identifierAssigner'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'instance creation' }
IdentifiedWebView class >> forComponentBuiltUsing: aComponentBuilder named: aName containing: aView [

	^ self
		forComponentBuiltUsing: aComponentBuilder
		named: aName
		containing: aView
		applying: [  ]
]

{ #category : #'instance creation' }
IdentifiedWebView class >> forComponentBuiltUsing: aComponentBuilder named: aName containing: aView applying: aComponentCommand [
	"Arguments:
		- aComponentBuilder - aValuable taking aCanvas as its argument
		- aName - the id of the HTML tag; will be mangled automatically to avoid conflicts
		- aView - my contents
		- aComponentCommand - Convertible to WebComponentCommand. Browse implementors of #asWebComponentCommand"

	^ self new
		initializeForComponentBuiltUsing: aComponentBuilder
		as: aName
		containing: aView
		applying: aComponentCommand asWebComponentCommand 
]

{ #category : #'instance creation' }
IdentifiedWebView class >> forDivNamed: aName containing: aView [

	^ self forDivNamed: aName containing: aView applying: [ :container |  ]
]

{ #category : #'instance creation' }
IdentifiedWebView class >> forDivNamed: aName containing: aView applying: aComponentCommand [

	^self
		forComponentBuiltUsing: [:canvas | canvas div]
		named: aName
		containing: aView
		applying: aComponentCommand
]

{ #category : #'instance creation' }
IdentifiedWebView class >> forFormNamed: aName containing: aView [

	^ self forFormNamed: aName containing: aView applying: [ :container |  ]
]

{ #category : #'instance creation' }
IdentifiedWebView class >> forFormNamed: aName containing: aView applying: aComponentCommand [

	^ self
		forComponentBuiltUsing: [ :canvas | canvas form doNotSubmit ]
		named: aName
		containing: aView
		applying: aComponentCommand
]

{ #category : #'instance creation' }
IdentifiedWebView class >> forLabeledFieldNamed: aName containing: aView [

	^ self forComponentBuiltUsing: [ :canvas | canvas fieldSet apply: [ :fieldSet | fieldSet addClass willow ] ] named: aName containing: aView
]

{ #category : #'instance creation' }
IdentifiedWebView class >> forRowNamed: aName containing: aView [

	^ self
		forComponentBuiltUsing: [ :canvas | canvas tableRow ]
		named: aName
		containing: aView
]

{ #category : #'instance creation' }
IdentifiedWebView class >> forSpanNamed: aName containing: aView [

	^ self forSpanNamed: aName containing: aView applying: [ ]
]

{ #category : #'instance creation' }
IdentifiedWebView class >> forSpanNamed: aName containing: aView applying: aComponentCommand [

	^ self forComponentBuiltUsing: [ :canvas | canvas span ] named: aName containing: aView applying: aComponentCommand
]

{ #category : #private }
IdentifiedWebView >> componentRenderedOn: aCanvas [

	^ componentBuilder value: aCanvas
]

{ #category : #accessing }
IdentifiedWebView >> identifier [

	^identifierAssigner assignedIdentifier
]

{ #category : #configuring }
IdentifiedWebView >> identifyIn: aCanvas [

	^ identifierAssigner identifyIn: aCanvas
]

{ #category : #'initialize-release' }
IdentifiedWebView >> initializeForComponentBuiltUsing: aComponentBuilder as: anIdentificationPrefix containing: aView applying: aComponentCommand [

	view := aView.
	componentBuilder := aComponentBuilder.
	commandToComponent := aComponentCommand.
	identifierAssigner := IdentifierAssigner prefixedBy: anIdentificationPrefix
]

{ #category : #configuring }
IdentifiedWebView >> onTrigger [

	^view onTrigger
]

{ #category : #rendering }
IdentifiedWebView >> renderContentOn: aCanvas [

	| identifier containerComponent |

	identifier := self identifyIn: aCanvas.
	containerComponent := self componentRenderedOn: aCanvas.
	"We need to set the id before applying the commands, because some command may require it"
	containerComponent
		id: identifier;
		with: view applying: commandToComponent
]

{ #category : #accessing }
IdentifiedWebView >> view [

	^view
]
