"
I'm a WebInteractionCommand that helps submiting forms
"
Class {
	#name : #FormSubmitCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'componentProvider'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
FormSubmitCommand class >> findingComponentUsing: aComponentProvider [

	^self new initializeFindingComponentUsing: aComponentProvider
]

{ #category : #'instance creation' }
FormSubmitCommand class >> forFormStyledAs: aCssStyle [

	^ self findingComponentUsing: [ :aCanvas | aCanvas jQuery cssSelector: (CssUniversalSelector implicit form class: aCssStyle) ]
]

{ #category : #'initialize - release' }
FormSubmitCommand >> initializeFindingComponentUsing: aComponentProvider [

	componentProvider := aComponentProvider
]

{ #category : #accessing }
FormSubmitCommand >> modelLoadingInstructions [

	^ WebInteractionInstructions
		directingTo: [ :aCanvas | ( componentProvider value: aCanvas ) call: 'submit' ]
		orderedAt: 10
]

{ #category : #accessing }
FormSubmitCommand >> priorityActions [

	^ #()
]

{ #category : #testing }
FormSubmitCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
FormSubmitCommand >> serverIndependentInstructions [

	^ WebInteractionInstructions empty
]
