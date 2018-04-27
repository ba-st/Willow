"
An exception signalled when some InvalidSelection received a message.
"
Class {
	#name : #SelectionIsInvalid,
	#superclass : #Error,
	#category : #'Willow-WebInteraction'
}

{ #category : #signaling }
SelectionIsInvalid class >> signal: aFailureExplanation [

	^ self signalAll: {aFailureExplanation}
]

{ #category : #signaling }
SelectionIsInvalid class >> signalAll: failureExplanations [

	^ self new
		tag: failureExplanations;
		signal: ('. ' join: failureExplanations)
]
