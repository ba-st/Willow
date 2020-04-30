"
I'm a builder of table column renderers
"
Class {
	#name : #WebTableColumnRendererBuilder,
	#superclass : #GRObject,
	#instVars : [
		'title',
		'renderingCommandBinding',
		'footerRenderingCommand',
		'cellCommand',
		'headingCommand',
		'footerCommand',
		'tableBuilder'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'instance creation' }
WebTableColumnRendererBuilder class >> on: aTableWebViewBuilder [

	^ self new initializeOn: aTableWebViewBuilder
]

{ #category : #configuring }
WebTableColumnRendererBuilder >> applyingToEachCell: aCellCommand [

	cellCommand := aCellCommand
]

{ #category : #building }
WebTableColumnRendererBuilder >> build [

	^ WebTableColumnRenderer
		titled: title
		applyingToEachCell: cellCommand
		renderingWith: renderingCommandBinding content
		applyingToHeading: headingCommand
		summarizedWith: footerRenderingCommand
		applyingToFooter: footerCommand
]

{ #category : #initialization }
WebTableColumnRendererBuilder >> initializeOn: aTableWebViewBuilder [

	tableBuilder := aTableWebViewBuilder.
	title := ''.
	renderingCommandBinding := Binding undefinedExplainedBy: 'Missing rendering configuration'.
	footerRenderingCommand := [  ].
	cellCommand := [  ].
	headingCommand := [  ].
	footerCommand := [  ]
]

{ #category : #configuring }
WebTableColumnRendererBuilder >> rendering: aRenderingCommand [

	renderingCommandBinding := Binding to: aRenderingCommand 
]

{ #category : #configuring }
WebTableColumnRendererBuilder >> summarizedWith: aFooterRenderingCommand [

	self summarizedWith: aFooterRenderingCommand applying: [  ]
]

{ #category : #configuring }
WebTableColumnRendererBuilder >> summarizedWith: aFooterRenderingCommand applying: aCommandToFooter [

	footerRenderingCommand := aFooterRenderingCommand.
	footerCommand := aCommandToFooter.
	tableBuilder renderFooter
]

{ #category : #configuring }
WebTableColumnRendererBuilder >> titled: aRenderable [

	self titled: aRenderable applying: [  ]
]

{ #category : #configuring }
WebTableColumnRendererBuilder >> titled: aRenderable applying: aHeadingCommand [

	title := aRenderable .
	headingCommand := aHeadingCommand .
	tableBuilder renderHeader
]
