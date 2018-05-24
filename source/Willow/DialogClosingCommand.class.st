"
I'm a WebInteractionCommand used to close a Dialog. I will not destroy the dialog, just hide it.

"
Class {
	#name : #DialogClosingCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'dialogSupplier'
	],
	#category : #'Willow-WebInteraction'
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

{ #category : #accessing }
DialogClosingCommand >> clientIndependentActions [

	^#()
]

{ #category : #initialization }
DialogClosingCommand >> initializeObtainingDialogsWith: aDialogSupplier [

	dialogSupplier := aDialogSupplier
]

{ #category : #accessing }
DialogClosingCommand >> modelLoadingActions [

	^ Array
		with: [ :aScript :aCanvas | 
			aCanvas session componentSupplier
				addStatementsTo: aScript
				toCloseDialogsIn: (aCanvas jQuery id: Constants >> #willow >> #dialogSectionName)
				matching: dialogSupplier
				on: aCanvas ]
]

{ #category : #accessing }
DialogClosingCommand >> priorityActions [

	^#()
]

{ #category : #testing }
DialogClosingCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
DialogClosingCommand >> serverIndependentActions [

	^#()
]
