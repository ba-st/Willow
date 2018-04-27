"
Command to execute a JS script on  a component (using script:).
"
Class {
	#name : #ComponentScriptCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'scriptProvider'
	],
	#category : #'Willow-Frontend'
}

{ #category : #'instance creation' }
ComponentScriptCommand class >> toExecute: aScriptProvider [

	^ self new initializeToExecute: aScriptProvider
]

{ #category : #applying }
ComponentScriptCommand >> applyTo: aComponent on: aCanvas [

	^ aComponent script: (scriptProvider cull: aCanvas)
]

{ #category : #'initialize-release' }
ComponentScriptCommand >> initializeToExecute: aScriptProvider [

	scriptProvider := aScriptProvider
]
