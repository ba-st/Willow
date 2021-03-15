"
I'm a WebInteractionCommand used to create and open a Dialog. 
The created Dialog will be appended to a section in the DOM.
"
Class {
	#name : #DialogOpeningCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'dialogView'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
DialogOpeningCommand class >> alwaysOpening: aDialogView [

	^ self new initializeAlwaysOpening: aDialogView
]

{ #category : #'initialize-release' }
DialogOpeningCommand >> initializeAlwaysOpening: aDialogView [

	dialogView := aDialogView
]

{ #category : #accessing }
DialogOpeningCommand >> modelLoadingInstructions [

	^ WebInteractionInstructions
		directingTo: [ :aCanvas | DialogOpener new open: dialogView on: aCanvas ]
		orderedAt: 10
]

{ #category : #accessing }
DialogOpeningCommand >> priorityActions [

	^ #()
]

{ #category : #accessing }
DialogOpeningCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
DialogOpeningCommand >> serverIndependentInstructions [

	^ WebInteractionInstructions empty
]
