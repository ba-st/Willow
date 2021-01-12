"
I'm a periodically rendered web view, easing the burden of refreshing automatically some content.
"
Class {
	#name : #PeriodicallyRenderedWebView,
	#superclass : #WAPainter,
	#instVars : [
		'stopRenderingContent',
		'refreshCommand',
		'refreshIntervalInMilliseconds',
		'conditionBlock',
		'viewToRefresh'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'Instance Creation' }
PeriodicallyRenderedWebView class >> evaluating: aRefreshCommand every: aNumber millisecondsThenRendering: aViewToRender [

	^ self
		evaluating: aRefreshCommand
		every: aNumber
		millisecondsThenRendering: aViewToRender
		until: [ false ]
]

{ #category : #'Instance Creation' }
PeriodicallyRenderedWebView class >> evaluating: aRefreshCommand every: aNumber millisecondsThenRendering: aViewToRender until: aConditionBlock [

	^ self new
		initializeEvaluating: aRefreshCommand
		every: aNumber
		millisecondsThenRendering: aViewToRender
		until: aConditionBlock
]

{ #category : #initialization }
PeriodicallyRenderedWebView >> initializeEvaluating: aRefreshCommand every: aNumber millisecondsThenRendering: aView until: aConditionBlock [

	refreshCommand := aRefreshCommand.
	refreshIntervalInMilliseconds := aNumber.
	conditionBlock := aConditionBlock.
	stopRenderingContent := false.
	self initializeViewToRefreshFrom: aView.
]

{ #category : #initialization }
PeriodicallyRenderedWebView >> initializeViewToRefreshFrom: aView [

	viewToRefresh := ContainerWebView
		wrapping: aView
		intoElementBuiltUsing: [ :canvas | canvas div ]
		applying: [  ].
	viewToRefresh beIdentifiable
]

{ #category : #'private-rendering' }
PeriodicallyRenderedWebView >> refreshAndRenderContentOn: aCanvas [

	refreshCommand value.
	aCanvas render: viewToRefresh renderableContent.

	stopRenderingContent := true.
	aCanvas document
		addLoadScript: ( aCanvas jQuery ajax callback: [ stopRenderingContent := conditionBlock value ] )
]

{ #category : #'private-rendering' }
PeriodicallyRenderedWebView >> refreshAndRenderOn: aCanvas [

	refreshCommand value.
	aCanvas render: viewToRefresh
]

{ #category : #rendering }
PeriodicallyRenderedWebView >> renderContentOn: aCanvas [

	self refreshAndRenderOn: aCanvas.

	aCanvas
		every: refreshIntervalInMilliseconds
		millisecondsEvaluateAsAjaxScript: [:scriptCanvas |
			self scriptToRefreshAndRenderContentOn: scriptCanvas]
		until: [stopRenderingContent]
]

{ #category : #'private-rendering' }
PeriodicallyRenderedWebView >> scriptToRefreshAndRenderContentOn: aCanvas [

	^ ( aCanvas locate: viewToRefresh )
		html: [ :renderingCanvas | self refreshAndRenderContentOn: renderingCanvas ]
]
