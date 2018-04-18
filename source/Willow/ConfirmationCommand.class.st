"
I'm a WebInteractionCommand used to ask the user for confirmation before proceeding.
"
Class {
	#name : #ConfirmationCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'question'
	],
	#category : 'Willow-WebInteraction'
}

{ #category : #'instance creation' }
ConfirmationCommand class >> asking: aQuestion [

	^self new initializeAsking: aQuestion
]

{ #category : #accessing }
ConfirmationCommand >> clientIndependentActions [

	^#()
]

{ #category : #'initialize-release' }
ConfirmationCommand >> initializeAsking: aQuestion [

	question := aQuestion
]

{ #category : #accessing }
ConfirmationCommand >> modelLoadingActions [

	^#()
]

{ #category : #accessing }
ConfirmationCommand >> priorityActions [

	^Array
		with: [:anAsynchronousCall :aCanvas | anAsynchronousCall confirm: question]
]

{ #category : #testing }
ConfirmationCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
ConfirmationCommand >> serverIndependentActions [

	^#()
]
