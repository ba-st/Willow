"
I'm a WebInteractionCommand used to close a Dialog. I will not destroy the dialog, just hide it.

"
Class {
	#name : #DialogClosingCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'dialogSupplier'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'Instance Creation' }
DialogClosingCommand class >> forAllDialogs [

	^ self obtainingDialogsWith: [ :jQuery | jQuery ]
]

{ #category : #'private-instance creation' }
DialogClosingCommand class >> obtainingDialogsWith: aDialogSupplier [

	^ self new initializeObtainingDialogsWith: aDialogSupplier
]

{ #category : #'Instance Creation' }
DialogClosingCommand class >> onlyForLastDialog [

	 ^self obtainingDialogsWith: [ :jQuery | jQuery last ]
]

{ #category : #initialization }
DialogClosingCommand >> initializeObtainingDialogsWith: aDialogSupplier [

	dialogSupplier := aDialogSupplier
]

{ #category : #accessing }
DialogClosingCommand >> modelLoadingInstructions [

	^ WebInteractionInstructions
		directingTo: [ :aCanvas | 
			aCanvas session componentSupplier
				statementToCloseDialogsIn: ( aCanvas jQuery id: Constants >> #willow >> #dialogSectionName )
				matching: dialogSupplier
				on: aCanvas
			]
]

{ #category : #accessing }
DialogClosingCommand >> priorityActions [

	^ #()
]

{ #category : #testing }
DialogClosingCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
DialogClosingCommand >> serverIndependentInstructions [

	^ WebInteractionInstructions empty
]
