Class {
	#name : #PluggableUserAgentCommandTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'command'
	],
	#category : #'Willow-Tests-WebInteraction'
}

{ #category : #initialization }
PluggableUserAgentCommandTest >> setUp [

	super setUp.
	command := PluggableUserAgentCommand executing: [ :canvas | JSStream this ]
]

{ #category : #'tests-accessing' }
PluggableUserAgentCommandTest >> testClientIndependentActions [

	self assert: command clientIndependentActions isEmpty
]

{ #category : #'tests-accessing' }
PluggableUserAgentCommandTest >> testModelLoadingActions [

	self assert: command modelLoadingActions isEmpty
]

{ #category : #'tests-accessing' }
PluggableUserAgentCommandTest >> testPriorityActions [

	self assert: command priorityActions isEmpty
]

{ #category : #'tests-testing' }
PluggableUserAgentCommandTest >> testRequiresSerialization [

	self deny: command requiresSerialization
]

{ #category : #'tests-accessing' }
PluggableUserAgentCommandTest >> testServerIndependentActions [

	| actions |

	actions := command serverIndependentActions.
	self assert: actions size equals: 1.
	actions do: [ :action | self render: [ :canvas | self assert: (action value: JSScript new value: canvas) greaseString equals: 'this' ] ]
]
