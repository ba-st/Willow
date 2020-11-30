"
I'm a WebInteractionCommand that allows for arbitrary code execution in the client
"
Class {
	#name : #PluggableUserAgentCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'serverIndependentAction'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
PluggableUserAgentCommand class >> executing: aServerIndependentAction [

	^ self new initializeExecuting: aServerIndependentAction
]

{ #category : #accessing }
PluggableUserAgentCommand >> clientIndependentActions [

	^ #()
]

{ #category : #initialization }
PluggableUserAgentCommand >> initializeExecuting: aServerIndependentAction [

	serverIndependentAction := [ :script :canvas | script << ( aServerIndependentAction cull: canvas ) ]
]

{ #category : #accessing }
PluggableUserAgentCommand >> modelLoadingActions [

	^ #()
]

{ #category : #accessing }
PluggableUserAgentCommand >> priorityActions [

	^ #()
]

{ #category : #testing }
PluggableUserAgentCommand >> requiresSerialization [

	^ false
]

{ #category : #accessing }
PluggableUserAgentCommand >> serverIndependentActions [

	^ Array with: serverIndependentAction
]
