"
A view to represent an html table
"
Class {
	#name : #TableWebView,
	#superclass : #WAPainter,
	#instVars : [
		'columnRenderers',
		'items',
		'interested',
		'header',
		'interactionInterpreter',
		'commandToRow',
		'commandToTable',
		'identifierAssigner'
	],
	#category : #'Willow-WebViews'
}

{ #category : #'instance creation' }
TableWebView class >> definedBy: aColumnRendererCollection applying: aTableCommand headerRenderedBy: aHeader applyingToEachRow: aRowCommand [

	^ self new
		initializeDefinedBy: aColumnRendererCollection
		applying: aTableCommand asWebComponentCommand
		headerRenderedBy: aHeader
		applyingToEachRow: aRowCommand asTableRowCommand
]

{ #category : #'instance creation' }
TableWebView class >> headedDefinedBy: aColumnRendererCollection applying: aTableCommand [

	^ self
		definedBy: aColumnRendererCollection
		applying: aTableCommand
		headerRenderedBy: (TableHeaderWebView definedBy: aColumnRendererCollection)
		applyingToEachRow: [ :row |  ]
]

{ #category : #'instance creation' }
TableWebView class >> headlessDefinedBy: aColumnRendererCollection applying: aTableCommand [

	^ self
		definedBy: aColumnRendererCollection
		applying: aTableCommand
		headerRenderedBy: [ :canvas |  ]
		applyingToEachRow: [ :row |  ]
]

{ #category : #'container-API' }
TableWebView >> changeContentsTo: anElementCollection [

	items := anElementCollection.
	self notifyInterested
]

{ #category : #'container-API' }
TableWebView >> contents [

	^items
]

{ #category : #accessing }
TableWebView >> identifier [

	^ identifierAssigner assignedIdentifier
]

{ #category : #configuring }
TableWebView >> identifyIn: aCanvas [

	^ identifierAssigner identifyIn: aCanvas
]

{ #category : #'initialize-release' }
TableWebView >> initializeDefinedBy: aColumnRendererCollection applying: aTableCommand headerRenderedBy: aHeader applyingToEachRow: aRowCommand [

	interested := Set new.
	columnRenderers := aColumnRendererCollection.
	commandToTable := aTableCommand.
	commandToRow := aRowCommand.
	header := aHeader.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent.
	identifierAssigner := IdentifierAssigner prefixedBy: 'table'.
	self changeContentsTo: #()
]

{ #category : #'container-API' }
TableWebView >> notifyChangesTo: aSupervisor [

	interested add: aSupervisor
]

{ #category : #private }
TableWebView >> notifyInterested [

	interested do: [:anInterested | anInterested changeNotifiedBy: self]
]

{ #category : #configuring }
TableWebView >> onTrigger [

	^interactionInterpreter
]

{ #category : #rendering }
TableWebView >> renderContentOn: aCanvas [

	| table |

	table := aCanvas table.
	table id: (self identifyIn: aCanvas).
	interactionInterpreter applyTo: table on: aCanvas.
	commandToTable applyTo: table on: aCanvas.

	table
		with: [ aCanvas render: header.
			aCanvas tableBody: [ items do: [ :item | self renderRowFor: item on: aCanvas ] ] ]
]

{ #category : #private }
TableWebView >> renderRowFor: anItem on: aCanvas [

	| row |

	row := aCanvas tableRow.
	commandToRow applyTo: row for: anItem on: aCanvas.
	row with: [columnRenderers do: [:renderer | renderer renderCellFor: anItem on: aCanvas]]
]
