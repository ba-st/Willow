"
I'm a WebInteractionCommand that allows for arbitrary code execution in the client
"
Class {
	#name : #UserAgentCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'serverIndependentAction'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
UserAgentCommand class >> executing: aServerIndependentAction [

	^ self new initializeExecuting: aServerIndependentAction
]

{ #category : #initialization }
UserAgentCommand >> initializeExecuting: aServerIndependentAction [

	serverIndependentAction := aServerIndependentAction
]

{ #category : #accessing }
UserAgentCommand >> modelLoadingActions [

	^ #()
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
UserAgentCommand >> serverIndependentActions [

	^ Array with: serverIndependentAction
]
