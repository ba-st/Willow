"
A NullWebInteractionCommandTest is a test class for testing the behavior of NullWebInteractionCommand
"
Class {
	#name : #NullWebInteractionCommandTest,
	#superclass : #TestCase,
	#category : #'Willow-Core-Tests-WebInteraction'
}

{ #category : #'tests-accessing' }
NullWebInteractionCommandTest >> testModelLoadingInstructions [

	self assert: NullWebInteractionCommand new modelLoadingInstructions isEmpty
]

{ #category : #'tests-accessing' }
NullWebInteractionCommandTest >> testPriorityActions [

	self assert: NullWebInteractionCommand new priorityActions isEmpty
]

{ #category : #'tests-testing' }
NullWebInteractionCommandTest >> testRequiresSerialization [

	self deny: NullWebInteractionCommand new requiresSerialization
]

{ #category : #'tests-accessing' }
NullWebInteractionCommandTest >> testServerIndependentInstructions [

	self assert: NullWebInteractionCommand new serverIndependentInstructions isEmpty
]
