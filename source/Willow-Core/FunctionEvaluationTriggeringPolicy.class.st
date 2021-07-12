Class {
	#name : #FunctionEvaluationTriggeringPolicy,
	#superclass : #TriggeringPolicy,
	#instVars : [
		'functionSelector',
		'argumentNames'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
FunctionEvaluationTriggeringPolicy class >> sending: aFunctionSelector parameterizedBy: anArgumentNameCollection [

	^ self new initializeSending: aFunctionSelector parameterizedBy: anArgumentNameCollection
]

{ #category : #evaluating }
FunctionEvaluationTriggeringPolicy >> apply: anAsynchronousCall to: aComponent on: aCanvas [

	aComponent perform: functionSelector with: ( anAsynchronousCall asFunction: argumentNames )
]

{ #category : #initialization }
FunctionEvaluationTriggeringPolicy >> initializeSending: aFunctionSelector parameterizedBy: anArgumentNameCollection [

	functionSelector := aFunctionSelector.
	argumentNames := anArgumentNameCollection
]
