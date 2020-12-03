"
I'm a WebInteractionCommand that allows for arbitrary code execution in the client
"
Class {
	#name : #UserAgentCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'serverIndependentInstructions'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
UserAgentCommand class >> executing: aServerIndependentInstruction [

	^ self new initializeExecuting: aServerIndependentInstruction
]

{ #category : #initialization }
UserAgentCommand >> initializeExecuting: aServerIndependentInstruction [

	serverIndependentInstructions := WebInteractionInstructions
		directingTo: aServerIndependentInstruction
]

{ #category : #accessing }
UserAgentCommand >> modelLoadingInstructions [

	^ WebInteractionInstructions empty
]

{ #category : #accessing }
UserAgentCommand >> priorityActions [

	^ #()
]

{ #category : #testing }
UserAgentCommand >> requiresSerialization [

	^ false
]

{ #category : #accessing }
UserAgentCommand >> serverIndependentInstructions [

	^ serverIndependentInstructions
]
