Class {
	#name : #PluggableExecutionOnClientCommandTest,
	#superclass : #WARenderingTest,
	#instVars : [
		'command',
		'commandAction'
	],
	#category : #'Willow-Tests-WebInteraction'
}

{ #category : #initialization }
PluggableExecutionOnClientCommandTest >> setUp [

	super setUp.
	commandAction := [ :parameter :somethingElse | self fail ].
	command := PluggableExecutionOnClientCommand executingOnly: commandAction
]

{ #category : #'tests-accessing' }
PluggableExecutionOnClientCommandTest >> testClientIndependentActions [

	self assert: command clientIndependentActions isEmpty
]

{ #category : #'tests-accessing' }
PluggableExecutionOnClientCommandTest >> testModelLoadingActions [

	self assert: command modelLoadingActions isEmpty
]

{ #category : #'tests-accessing' }
PluggableExecutionOnClientCommandTest >> testPriorityActions [

	self assert: command priorityActions isEmpty
]

{ #category : #'tests-testing' }
PluggableExecutionOnClientCommandTest >> testRequiresSerialization [

	self deny: command requiresSerialization
]

{ #category : #'tests-accessing' }
PluggableExecutionOnClientCommandTest >> testServerIndependentActions [

	self
		assertCollection: command serverIndependentActions
		equals: (Array with: commandAction)
]
