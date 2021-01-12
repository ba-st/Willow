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
	#category : #'Willow-Core-MigrationTo14'
}

{ #category : #'instance creation' }
IdentifiedWebView class >> forComponentBuiltUsing: aComponentBuilder named: aName containing: aView [

	self
		deprecated: 'Use ContainerWebView instead'
		transformWith:
			'`@receiver forComponentBuiltUsing: `@aComponentBuilder named: `@aName containing: `@aView'
				-> 'ContainerWebView wrapping: `@aView intoElementBuiltUsing: `@aComponentBuilder applying: [  ]'.
	^ ContainerWebView wrapping: aView intoElementBuiltUsing: aComponentBuilder applying: [  ]
]

{ #category : #'instance creation' }
IdentifiedWebView class >> forComponentBuiltUsing: aComponentBuilder named: aName containing: aView applying: aComponentCommand [

	self
		deprecated: 'Use ContainerWebView instead'
		transformWith:
			'`@receiver forComponentBuiltUsing: `@aComponentBuilder named: `@aName containing: `@aView applying: `@aComponentCommand'
				->
					'ContainerWebView wrapping: `@aView intoElementBuiltUsing: `@aComponentBuilder applying: `@aComponentCommand'.
	^ ContainerWebView
		wrapping: aView
		intoElementBuiltUsing: aComponentBuilder
		applying: aComponentCommand
]

{ #category : #'instance creation' }
IdentifiedWebView class >> forDivNamed: aName containing: aView [

	self
		deprecated:
			'Use componentSupplier divisionContainerWrapping:applying: if available, otherwise create a ContainerWebView using the same implementation'
			transformWith:
			'`@receiver forDivNamed: `@aName containing: `@aView'
				-> 'self componentSupplier divisionContainerWrapping: `@aView applying: []'
			when: [ thisContext activeHome notNil
					and: [ thisContext activeHome sender receiver respondsTo: #componentSupplier ]
				];
		deprecated:
			'Use componentSupplier divisionContainerWrapping:applying: if available, otherwise create a ContainerWebView using the same implementation'
			transformWith:
			'`@receiver forDivNamed: `@aName containing: `@aView'
				-> 'ContainerWebView wrapping: `@aView intoElementBuiltUsing: [ :canvas | canvas div ] applying: [  ]'.
	^ ContainerWebView wrapping: aView intoElementBuiltUsing: [ :canvas | canvas div ] applying: [  ]
]

{ #category : #'instance creation' }
IdentifiedWebView class >> forDivNamed: aName containing: aView applying: aComponentCommand [

	self
		deprecated:
			'Use componentSupplier divisionContainerWrapping:applying: if available, otherwise create a ContainerWebView using the same implementation'
			transformWith:
			'`@receiver forDivNamed: `@aName containing: `@aView applying: `@aComponentCommand'
				-> 'self componentSupplier divisionContainerWrapping: `@aView applying: `@aComponentCommand'
			when: [ thisContext activeHome sender receiver respondsTo: #componentSupplier ];
		deprecated:
			'Use componentSupplier divisionContainerWrapping:applying: if available, otherwise create a ContainerWebView using the same implementation'
			transformWith:
			'`@receiver forDivNamed: `@aName containing: `@aView applying: `@aComponentCommand'
				->
					'ContainerWebView wrapping: `@aView intoElementBuiltUsing: [ :canvas | canvas div ] applying: `@aComponentCommand'.
	^ ContainerWebView
		wrapping: aView
		intoElementBuiltUsing: [ :canvas | canvas div ]
		applying: aComponentCommand
]

{ #category : #'instance creation' }
IdentifiedWebView class >> forFormNamed: aName containing: aView [

	self
		deprecated: 'Use ContainerWebView instead'
		transformWith:
			'`@receiver forFormNamed: `@aName containing: `@aView'
				->
					'ContainerWebView wrapping: `@aView intoElementBuiltUsing: [ :canvas | canvas form doNotSubmit ] applying: [  ]'.
	^ ContainerWebView
		wrapping: aView
		intoElementBuiltUsing: [ :canvas | canvas form doNotSubmit ]
		applying: [  ]
]

{ #category : #'instance creation' }
IdentifiedWebView class >> forFormNamed: aName containing: aView applying: aComponentCommand [

	self
		deprecated: 'Use ContainerWebView instead'
		transformWith:
			'`@receiver forFormNamed: `@aName containing: `@aView applying: `@aComponentCommand'
				->
					'ContainerWebView wrapping: `@aView intoElementBuiltUsing: [ :canvas | canvas form doNotSubmit ] applying: `@aComponentCommand'.
	^ ContainerWebView
		wrapping: aView
		intoElementBuiltUsing: [ :canvas | canvas form doNotSubmit ]
		applying: aComponentCommand
]

{ #category : #'instance creation' }
IdentifiedWebView class >> forLabeledFieldNamed: aName containing: aView [

	self
		deprecated: 'Use ContainerWebView instead'
		transformWith:
			'`@receiver forLabeledFieldNamed: `@aName containing: `@aView'
				->
					'ContainerWebView wrapping: `@aView intoElementBuiltUsing: [ :canvas | canvas fieldSet apply: [ :fieldSet | fieldSet addClass willow ] ] applying: [  ]'.
	^ ContainerWebView
		wrapping: aView
		intoElementBuiltUsing: [ :canvas | canvas fieldSet apply: [ :fieldSet | fieldSet addClass willow ] ]
		applying: [  ]
]

{ #category : #'instance creation' }
IdentifiedWebView class >> forRowNamed: aName containing: aView [

	self
		deprecated: 'Use ContainerWebView instead'
		transformWith:
			'`@receiver forRowNamed: `@aName containing: `@aView'
				->
					'ContainerWebView wrapping: `@aView intoElementBuiltUsing: [ :canvas | canvas tableRow ] applying: [  ]'.
	^ ContainerWebView
		wrapping: aView
		intoElementBuiltUsing: [ :canvas | canvas tableRow ]
		applying: [  ]
]

{ #category : #'instance creation' }
IdentifiedWebView class >> forSpanNamed: aName containing: aView [

	self
		deprecated:
			'Use componentSupplier inlineContainerWrapping:applying: if available, otherwise create a ContainerWebView using the same implementation'
			transformWith:
			'`@receiver forSpanNamed: `@aName containing: `@aView'
				-> 'self componentSupplier inlineContainerWrapping: `@aView applying: []'
			when: [ thisContext activeHome sender receiver respondsTo: #componentSupplier ];
		deprecated:
			'Use componentSupplier inlineContainerWrapping:applying: if available, otherwise create a ContainerWebView using the same implementation'
			transformWith:
			'`@receiver forSpanNamed: `@aName containing: `@aView'
				-> 'ContainerWebView wrapping: `@aView intoElementBuiltUsing: [ :canvas | canvas span ] applying: [  ]'.
	^ ContainerWebView wrapping: aView intoElementBuiltUsing: [ :canvas | canvas span ] applying: [  ]
]

{ #category : #'instance creation' }
IdentifiedWebView class >> forSpanNamed: aName containing: aView applying: aComponentCommand [

	self
		deprecated:
			'Use componentSupplier inlineContainerWrapping:applying: if available, otherwise create a ContainerWebView using the same implementation'
		transformWith:
			'`@receiver forSpanNamed: `@aName containing: `@aView applying: `@aComponentCommand'
				-> 'self componentSupplier inlineContainerWrapping: `@aView applying: `@aComponentCommand'
		when: [ thisContext activeHome sender receiver respondsTo: #componentSupplier ];
		deprecated:
			'Use componentSupplier inlineContainerWrapping:applying: if available, otherwise create a ContainerWebView using the same implementation'
		transformWith:
			'`@receiver forSpanNamed: `@aName containing: `@aView applying: `@aComponentCommand'
				-> 'ContainerWebView wrapping: `@aView intoElementBuiltUsing: [ :canvas | canvas span ] applying: `@aComponentCommand'.
	^ ContainerWebView wrapping: aView intoElementBuiltUsing: [ :canvas | canvas span ] applying: aComponentCommand
]

{ #category : #configuring }
IdentifiedWebView >> beIdentifiable [

	"This is always the case for identified web views"

	
]

{ #category : #private }
IdentifiedWebView >> componentRenderedOn: aCanvas [

	^ componentBuilder value: aCanvas
]

{ #category : #accessing }
IdentifiedWebView >> identifierOn: aCanvas [

	^ identifierAssigner identifierOn: aCanvas
]

{ #category : #initialization }
IdentifiedWebView >> initializeForComponentBuiltUsing: aComponentBuilder as: anIdentificationPrefix containing: aView applying: aComponentCommand [

	view := aView.
	componentBuilder := aComponentBuilder.
	commandToComponent := aComponentCommand.
	identifierAssigner := IdentifierAssigner prefixedBy: anIdentificationPrefix
]

{ #category : #configuring }
IdentifiedWebView >> on [

	^ view on
]

{ #category : #configuring }
IdentifiedWebView >> onTrigger [

	self
		deprecated: 'Use #on instead.'
		transformWith: '`@receiver onTrigger' -> '`@receiver on trigger'.
	^ self on trigger
]

{ #category : #rendering }
IdentifiedWebView >> renderContentOn: aCanvas [

	| identifier containerComponent |

	identifier := self identifierOn: aCanvas.
	containerComponent := self componentRenderedOn: aCanvas.
	"We need to set the id before applying the commands, because some command may require it"
	containerComponent
		id: identifier;
		with: view applying: commandToComponent
]

{ #category : #accessing }
IdentifiedWebView >> renderableContent [

	^ view
]

{ #category : #accessing }
IdentifiedWebView >> view [

	self
		deprecated: 'Use #renderableContent instead'
		transformWith: '`@receiver view' -> '`@receiver renderableContent'.
	^ self renderableContent
]
