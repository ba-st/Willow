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
		'identifiedViewToRefresh',
		'conditionBlock'
	],
	#category : #'Willow-WebViews'
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
		millisecondsThenRendering:
			(IdentifiedWebView
				forDivNamed: 'periodically-refreshed'
				containing: aViewToRender)
		until: aConditionBlock
]

{ #category : #initialization }
PeriodicallyRenderedWebView >> initializeEvaluating: aRefreshCommand every: aNumber millisecondsThenRendering: anIdentifiedWebView until: aConditionBlock [

	refreshCommand := aRefreshCommand.
	refreshIntervalInMilliseconds := aNumber.
	identifiedViewToRefresh := anIdentifiedWebView.
	conditionBlock := aConditionBlock.
	stopRenderingContent := false
]

{ #category : #'private-rendering' }
PeriodicallyRenderedWebView >> refreshAndRenderContentOn: aCanvas [

	refreshCommand value.
	aCanvas render: identifiedViewToRefresh view.

	stopRenderingContent := true.
	aCanvas document addLoadScript: (aCanvas jQuery ajax callback: [ stopRenderingContent := conditionBlock value ])
]

{ #category : #'private-rendering' }
PeriodicallyRenderedWebView >> refreshAndRenderOn: aCanvas [

	refreshCommand value.
	aCanvas render: identifiedViewToRefresh
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

	^(aCanvas jQuery id: identifiedViewToRefresh identifier)
		html: [:renderingCanvas | self refreshAndRenderContentOn: renderingCanvas]
]
