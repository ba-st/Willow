"
I'm a web view showing a throbber while evaluating an action block and then rendering another view
"
Class {
	#name : #DelayedViewRenderer,
	#superclass : #WAPainter,
	#instVars : [
		'identifiedDelayedView',
		'currentView',
		'interpreter'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'instance creation' }
DelayedViewRenderer class >> showing: aThrobber whileEvaluating: aBlock thenRendering: aView [

	^ self new initializeShowing: aThrobber whileEvaluating: aBlock thenRendering: aView
]

{ #category : #initialization }
DelayedViewRenderer >> initializeInterpreterToEvaluate: aBlock thenRender: aView [

	interpreter := WebInteractionInterpreter forInstantEvaluation.
	interpreter
		serverDo: [ :request | 
			aBlock value.
			self setCurrentViewTo: aView
			];
		render: identifiedDelayedView
]

{ #category : #initialization }
DelayedViewRenderer >> initializeShowing: aThrobber whileEvaluating: aBlock thenRendering: aView [

	self setCurrentViewTo: aThrobber.
	identifiedDelayedView := IdentifiedWebView
		forDivNamed: 'Delayed'
		containing: [ :canvas | canvas render: currentView ].
	self initializeInterpreterToEvaluate: aBlock thenRender: aView
]

{ #category : #rendering }
DelayedViewRenderer >> renderContentOn: aCanvas [

	aCanvas render: identifiedDelayedView.
	interpreter applyTo: self on: aCanvas
]

{ #category : #initialization }
DelayedViewRenderer >> setCurrentViewTo: aView [

	currentView := aView
]
