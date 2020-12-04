"
A command applying another command only if the condition is satisfied.
"
Class {
	#name : #ConditionalComponentCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'command',
		'conditionBlock'
	],
	#category : #'Willow-Core-Frontend'
}

{ #category : #'Instance Creation' }
ConditionalComponentCommand class >> applying: aComponentCommand when: aConditionBlock [

	^ self new initializeApplying: aComponentCommand when: aConditionBlock
]

{ #category : #processing }
ConditionalComponentCommand >> applyTo: aComponent on: aCanvas [

	( conditionBlock cull: aComponent ) then: [ command applyTo: aComponent on: aCanvas ]
]

{ #category : #initialization }
ConditionalComponentCommand >> initializeApplying: aComponentCommand when: aConditionBlock [

	command := aComponentCommand.
	conditionBlock := aConditionBlock
]
