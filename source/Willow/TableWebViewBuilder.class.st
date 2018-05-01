"
I'm a builder of TableWebVIews
"
Class {
	#name : #TableWebViewBuilder,
	#superclass : #WillowComponentBuilder,
	#instVars : [
		'columnRenderers',
		'rowCommand',
		'tableCommand',
		'headerProvider',
		'footerProvider'
	],
	#category : #'Willow-WebViews'
}

{ #category : #Configuring }
TableWebViewBuilder >> addColumnTitled: aTitle rendering: aRenderingCommand [

	self
		addColumnTitled: aTitle
		rendering: aRenderingCommand
		applyingToCells: [ :cell |  ]
		applyingToHeading: [ :heading |  ]
]

{ #category : #Configuring }
TableWebViewBuilder >> addColumnTitled: aTitle rendering: aRenderingCommand applyingToCells: aCellCommand applyingToHeading: aHeadingCommand [

	columnRenderers
		add:
			(WebTableColumnRenderer
				titled: aTitle
				applyingToEachCell: aCellCommand
				renderingWith: aRenderingCommand
				applyingToHeading: aHeadingCommand)
]

{ #category : #Configuring }
TableWebViewBuilder >> addColumnTitled: aTitle rendering: aRenderingCommand applyingToCells: aCellCommand applyingToHeading: aHeadingCommand summarizedWith: aFooterRenderingCommand applyingToFooter: aFooterCommand [

	columnRenderers
		add:
			(WebTableColumnRenderer
				titled: aTitle
				applyingToEachCell: aCellCommand
				renderingWith: aRenderingCommand
				applyingToHeading: aHeadingCommand
				summarizedWith: aFooterRenderingCommand
				applyingToFooter: aFooterCommand).
	footerProvider := [ :columns | TableFooterWebView definedBy: columns ]
]

{ #category : #Configuring }
TableWebViewBuilder >> addColumnTitled: aTitle renderingAll: renderingCommands [

	self
		addColumnTitled: aTitle
		renderingAll: renderingCommands
		applyingToCells: [ :cell |  ]
		applyingToHeading: [ :heading |  ]
]

{ #category : #Configuring }
TableWebViewBuilder >> addColumnTitled: aTitle renderingAll: renderingCommands applyingToCells: aCellCommand applyingToHeading: aHeadingCommand [

	columnRenderers
		add:
			(WebTableMultiColumnRenderer
				titled: aTitle
				applyingToEachCell: aCellCommand
				renderingWithAll: renderingCommands
				applyingToHeading: aHeadingCommand)
]

{ #category : #Configuring }
TableWebViewBuilder >> addUntitledColumnRendering: aRenderingCommand [

	self addColumnTitled: '' rendering: aRenderingCommand
]

{ #category : #Configuring }
TableWebViewBuilder >> applyToEachRow: aRowCommand [

	rowCommand := aRowCommand
]

{ #category : #Configuring }
TableWebViewBuilder >> beHeadless [

	headerProvider := [ :columns | [ :canvas |  ] ]
]

{ #category : #Building }
TableWebViewBuilder >> buildApplying: aComponentCommand [

	^ TableWebView
		definedBy: columnRenderers
		applying: tableCommand + aComponentCommand
		headerRenderedBy: (headerProvider value: columnRenderers)
		applyingToEachRow: rowCommand
		footerRenderedBy: (footerProvider value: columnRenderers)
]

{ #category : #initialization }
TableWebViewBuilder >> initialize [

	super initialize.
	columnRenderers := OrderedCollection new.
	tableCommand := [  ] asWebComponentCommand.
	rowCommand := [  ] asWebComponentCommand.
	headerProvider := [ :columns | TableHeaderWebView definedBy: columns ].
	footerProvider := [ :columns | NullTableFooterWebView new ]
]

{ #category : #Configuring }
TableWebViewBuilder >> styledWith: aCssClass [

	tableCommand := tableCommand + (ComponentClassificationCommand toStyleWith: aCssClass)
]
