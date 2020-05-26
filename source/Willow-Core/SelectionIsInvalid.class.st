"
An exception signalled when some InvalidSelection received a message.
"
Class {
	#name : #SelectionIsInvalid,
	#superclass : #Error,
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #signaling }
SelectionIsInvalid class >> signal: aFailureExplanation [

	^ self signalAll: {aFailureExplanation}
]
