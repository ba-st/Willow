"
I'm a WebInteractionCommand used to ask the user for confirmation before proceeding.
"
Class {
	#name : #ConfirmationCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'question'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
ConfirmationCommand class >> asking: aQuestion [

	^ self new initializeAsking: aQuestion
]

{ #category : #initialization }
ConfirmationCommand >> initializeAsking: aQuestion [

	question := aQuestion
]

{ #category : #accessing }
ConfirmationCommand >> modelLoadingInstructions [

	^ WebInteractionInstructions empty
]

{ #category : #accessing }
ConfirmationCommand >> priorityActions [

	^ Array with: [ :anAsynchronousCall :aCanvas | anAsynchronousCall confirm: question ]
]

{ #category : #testing }
ConfirmationCommand >> requiresSerialization [

	^ false
]

{ #category : #accessing }
ConfirmationCommand >> serverIndependentInstructions [

	^ WebInteractionInstructions empty
]
