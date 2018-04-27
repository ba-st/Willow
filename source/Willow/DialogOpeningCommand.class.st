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
	#category : #'Willow-WebInteraction'
}

{ #category : #'instance creation' }
DialogOpeningCommand class >> alwaysOpening: aDialogView [

	^ self new initializeAlwaysOpening: aDialogView
]

{ #category : #accessing }
DialogOpeningCommand >> clientIndependentActions [

	^#()
]

{ #category : #'initialize-release' }
DialogOpeningCommand >> initializeAlwaysOpening: aDialogView [

	dialogView := aDialogView
]

{ #category : #accessing }
DialogOpeningCommand >> modelLoadingActions [

	^ Array with: [ :aScript :aCanvas | aScript << (DialogOpener new open: dialogView on: aCanvas) ]
]

{ #category : #accessing }
DialogOpeningCommand >> priorityActions [

	^#()
]

{ #category : #accessing }
DialogOpeningCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
DialogOpeningCommand >> serverIndependentActions [

	^#()
]
