"
A NullWebInteractionCommandTest is a test class for testing the behavior of NullWebInteractionCommand
"
Class {
	#name : #NullWebInteractionCommandTest,
	#superclass : #TestCase,
	#category : #'Willow-Tests-WebInteraction'
}

{ #category : #'tests-accessing' }
NullWebInteractionCommandTest >> testClientIndependentActions [

	self assert: NullWebInteractionCommand new clientIndependentActions isEmpty
]

{ #category : #'tests-accessing' }
NullWebInteractionCommandTest >> testModelLoadingActions [

	self assert: NullWebInteractionCommand new modelLoadingActions isEmpty
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
NullWebInteractionCommandTest >> testServerIndependentActions [

	self assert: NullWebInteractionCommand new serverIndependentActions isEmpty
]
