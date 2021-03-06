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
		'identifierAssigner',
		'footer'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'instance creation' }
TableWebView class >> definedBy: aColumnRendererCollection applying: aTableCommand headerRenderedBy: aHeader applyingToEachRow: aRowCommand footerRenderedBy: aFooter [

	^ self new
		initializeDefinedBy: aColumnRendererCollection
		applying: aTableCommand asWebComponentCommand
		headerRenderedBy: aHeader
		applyingToEachRow: aRowCommand asTableRowCommand
		footerRenderedBy: aFooter
]

{ #category : #configuring }
TableWebView >> beIdentifiable [

	^ identifierAssigner beRequired
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
TableWebView >> identifierOn: aCanvas [

	^ identifierAssigner identifierOn: aCanvas
]

{ #category : #'initialize-release' }
TableWebView >> initializeDefinedBy: aColumnRendererCollection applying: aTableCommand headerRenderedBy: aHeader applyingToEachRow: aRowCommand footerRenderedBy: aFooter [

	interested := Set new.
	columnRenderers := aColumnRendererCollection.
	commandToTable := aTableCommand.
	commandToRow := aRowCommand.
	header := aHeader.
	footer := aFooter.
	self notifyChangesTo: footer.
	interactionInterpreter := EventInterpreterDispatcher defaultingToClick.
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
TableWebView >> on [

	^ interactionInterpreter
]

{ #category : #rendering }
TableWebView >> renderContentOn: aCanvas [

	aCanvas table
		beIdentifiableUsing: identifierAssigner;
		interactUsing: interactionInterpreter;
		with: [ aCanvas render: header.
			aCanvas
				tableBody: [ items doWithIndex: [ :item :index | self renderRowAt: index for: item on: aCanvas ] ].
			aCanvas render: footer
			]
			applying: commandToTable
]

{ #category : #private }
TableWebView >> renderRowAt: anIndex for: anItem on: aCanvas [

	| row |

	row := aCanvas tableRow.
	commandToRow applyTo: row for: anItem on: aCanvas.
	row with: [ columnRenderers do: [ :renderer | renderer renderCellAt: anIndex for: anItem on: aCanvas ] ]
]
