Class {
	#name : 'FunctionEvaluationTrigger',
	#superclass : 'TriggeringPolicy',
	#instVars : [
		'functionSelector',
		'argumentNames'
	],
	#category : 'Willow-Core-WebInteraction',
	#package : 'Willow-Core',
	#tag : 'WebInteraction'
}

{ #category : 'instance creation' }
FunctionEvaluationTrigger class >> sending: aFunctionSelector parameterizedBy: anArgumentNameCollection [

	^ self new initializeSending: aFunctionSelector parameterizedBy: anArgumentNameCollection
]

{ #category : 'evaluating' }
FunctionEvaluationTrigger >> apply: anAsynchronousCall to: aComponent on: aCanvas [

	aComponent perform: functionSelector with: ( anAsynchronousCall asFunction: argumentNames )
]

{ #category : 'initialization' }
FunctionEvaluationTrigger >> initializeSending: aFunctionSelector parameterizedBy: anArgumentNameCollection [

	functionSelector := aFunctionSelector.
	argumentNames := anArgumentNameCollection
]
