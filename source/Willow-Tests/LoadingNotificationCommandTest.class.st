"
A LoadingNotificationCommandTest is a test class for testing the behavior of LoadingNotificationCommand
"
Class {
	#name : #LoadingNotificationCommandTest,
	#superclass : #WARenderingTest,
	#instVars : [
		'command'
	],
	#category : 'Willow-Tests-WebInteraction'
}

{ #category : #initialization }
LoadingNotificationCommandTest >> setUp [

	super setUp.
	command := LoadingNotificationCommand onPageTopWithClasses: #()
]

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> testClientIndependentActions [

	self assert: command clientIndependentActions isEmpty
]

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> testModelLoadingActions [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script anchor |

			script := canvas javascript.
			anchor := canvas anchor.
			canvas ensureIdFor: anchor.

			command modelLoadingActions do: [ :action | action value: script value: canvas ].
			anchor script: (canvas jQuery this onClick: script) ].

	self
		assert: html
		equals: '<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){$("#willow-notification-section").html("")});</script>'
]

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> testPriorityActions [

	self assert: command priorityActions isEmpty
]

{ #category : #'tests-testing' }
LoadingNotificationCommandTest >> testRequiresSerialization [

	self deny: command requiresSerialization
]

{ #category : #'tests-accessing' }
LoadingNotificationCommandTest >> testServerIndependentActions [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script anchor |

			script := canvas javascript.
			command serverIndependentActions do: [ :action | action value: script value: canvas ].
			anchor := canvas anchor.
			canvas ensureIdFor: anchor.
			anchor script: (canvas jQuery this onClick: script) ].

	self
		assert: html
		equals:
			'<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){$("#willow-notification-section").html("<div>Loading...</div>")});</script>'
]
