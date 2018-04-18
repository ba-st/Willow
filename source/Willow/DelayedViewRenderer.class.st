"
I'm a web view showing a throbber while evaluating an action block and then rendering another view
"
Class {
	#name : #DelayedViewRenderer,
	#superclass : #WAPainter,
	#instVars : [
		'identifiedDelayedView',
		'currentView',
		'interaction'
	],
	#category : 'Willow-WebViews'
}

{ #category : #'instance creation' }
DelayedViewRenderer class >> showing: aThrobber whileEvaluating: aBlock thenRendering: aView [

	^ self new initializeShowing: aThrobber whileEvaluating: aBlock thenRendering: aView
]

{ #category : #initialization }
DelayedViewRenderer >> initializeInteractionToEvaluate: aBlock thenRender: aView [

	interaction := WebComponentInteraction triggeredOnClick.
	interaction
		onTriggerExecute:
			(DelayedCommand
				withBehaviorDeterminedBy: [ :response | 
					aBlock value.
					self setCurrentViewTo: aView ]);
		onTriggerExecute: (RenderingCommand for: identifiedDelayedView)
]

{ #category : #initialization }
DelayedViewRenderer >> initializeShowing: aThrobber whileEvaluating: aBlock thenRendering: aView [

	self setCurrentViewTo: aThrobber.
	identifiedDelayedView := IdentifiedWebView forDivNamed: 'Delayed' containing: [ :canvas | canvas render: currentView ].
	self initializeInteractionToEvaluate: aBlock thenRender: aView
]

{ #category : #rendering }
DelayedViewRenderer >> renderContentOn: aCanvas [

	aCanvas render: identifiedDelayedView.
	"This is way too hacky, but for now is the way to go"
	interaction prepareActions.
	aCanvas document addLoadScript: (interaction commandToExecuteOn: aCanvas)
]

{ #category : #initialization }
DelayedViewRenderer >> setCurrentViewTo: aView [

	currentView := aView
]
