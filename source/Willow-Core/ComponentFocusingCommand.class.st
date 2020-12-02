"
I'm a WebInteractionCommand allowing to put the focus in a component
"
Class {
	#name : #ComponentFocusingCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'componentProvider'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
ComponentFocusingCommand class >> findingComponentUsing: aComponentProvider [

	^self new initializeFindingComponentUsing: aComponentProvider
]

{ #category : #'instance creation' }
ComponentFocusingCommand class >> for: anIdentifiedView [

	^ self
		findingComponentUsing: [ :aCanvas | 
			anIdentifiedView identifyIn: aCanvas.
			aCanvas jQuery id: anIdentifiedView identifier ]
]

{ #category : #'initialize-release' }
ComponentFocusingCommand >> initializeFindingComponentUsing: aComponentProvider [

	componentProvider := aComponentProvider
]

{ #category : #accessing }
ComponentFocusingCommand >> modelLoadingActions [

	^ Array with: [ :aCanvas | ( componentProvider value: aCanvas ) triggerFocus ]
]

{ #category : #accessing }
ComponentFocusingCommand >> priorityActions [

	^ #()
]

{ #category : #testing }
ComponentFocusingCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
ComponentFocusingCommand >> serverIndependentActions [

	^ #()
]
