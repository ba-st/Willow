Class {
	#name : #UserAgentCommandTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'command'
	],
	#category : #'Willow-Tests-WebInteraction'
}

{ #category : #initialization }
UserAgentCommandTest >> setUp [

	super setUp.
	command := UserAgentCommand executing: [ :canvas | JSStream this ]
]

{ #category : #'tests-accessing' }
UserAgentCommandTest >> testModelLoadingActions [

	self assert: command modelLoadingActions isEmpty
]

{ #category : #'tests-accessing' }
UserAgentCommandTest >> testPriorityActions [

	self assert: command priorityActions isEmpty
]

{ #category : #'tests-testing' }
UserAgentCommandTest >> testRequiresSerialization [

	self deny: command requiresSerialization
]

{ #category : #'tests-accessing' }
UserAgentCommandTest >> testServerIndependentActions [

	| actions |

	actions := command serverIndependentActions.
	self assert: actions size equals: 1.
	actions do: [ :action | self render: [ :canvas | self assert: (action cull: canvas) greaseString equals: 'this' ] ]
]
