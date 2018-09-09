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
	commandAction := [ :canvas | JSStream this ].
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

	| actions |

	actions := command serverIndependentActions.
	self assert: actions size equals: 1.
	actions do: [ :action | self render: [ :canvas | self assert: (action value: JSScript new value: canvas) greaseString equals: 'this' ] ]
]
