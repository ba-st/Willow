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
	#category : #'Willow-Core-WebViews'
}

{ #category : #Configuring }
TableWebViewBuilder >> addColumn: aMonadycBlock [

	| builder |

	builder := WebTableColumnRendererBuilder on: self.
	aMonadycBlock value: builder.
	columnRenderers add: builder build
]

{ #category : #Configuring }
TableWebViewBuilder >> apply: aTableCommand [

	tableCommand := tableCommand + aTableCommand
]

{ #category : #Configuring }
TableWebViewBuilder >> applyToEachRow: aRowCommand [

	rowCommand := aRowCommand
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

{ #category : #'private - configuring' }
TableWebViewBuilder >> doNotRenderFooter [

	footerProvider := [ :columns | NullTableFooterWebView new ]
]

{ #category : #'private - configuring' }
TableWebViewBuilder >> doNotRenderHeader [

	headerProvider := [ :columns | [ :canvas |  ] ]
]

{ #category : #initialization }
TableWebViewBuilder >> initialize [

	super initialize.
	columnRenderers := OrderedCollection new.
	tableCommand := [  ] asWebComponentCommand.
	rowCommand := [  ] asWebComponentCommand.
	self
		doNotRenderHeader;
		doNotRenderFooter
]

{ #category : #'private - configuring' }
TableWebViewBuilder >> renderFooter [

	footerProvider := [ :columns | TableFooterWebView definedBy: columns ]
]

{ #category : #'private - configuring' }
TableWebViewBuilder >> renderHeader [

	headerProvider := [ :columns | TableHeaderWebView definedBy: columns ]
]

{ #category : #Configuring }
TableWebViewBuilder >> styledWith: aCssClass [

	self apply: (ComponentClassificationCommand toStyleWith: aCssClass)
]
