"
A DialogClosingCommandTest is a test class for testing the behavior of DialogClosingCommand
"
Class {
	#name : #DialogClosingCommandTest,
	#superclass : #WARenderingTest,
	#instVars : [
		'command'
	],
	#category : 'Willow-Tests-WebInteraction'
}

{ #category : #private }
DialogClosingCommandTest >> componentSupplier [
	
	^Html5ComponentSupplier new
]

{ #category : #private }
DialogClosingCommandTest >> createHandlers [

	^ Array with: self
]

{ #category : #private }
DialogClosingCommandTest >> isSession [

^true
]

{ #category : #private }
DialogClosingCommandTest >> session [

	"I will simulate to be the session, because it's only used to ask it the componentSupplier"

	^ self
]

{ #category : #initialization }
DialogClosingCommandTest >> setUp [

	super setUp.
	command := DialogClosingCommand forAllDialogs
]

{ #category : #'tests-accessing' }
DialogClosingCommandTest >> testClientIndependentActions [

	self assert: command clientIndependentActions isEmpty
]

{ #category : #'tests-accessing' }
DialogClosingCommandTest >> testModelLoadingActionsWhenOnlyRemovingLastDialog [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script anchor |

			script := canvas javascript.
			anchor := canvas anchor.
			canvas ensureIdFor: anchor.
			DialogClosingCommand onlyForLastDialog modelLoadingActions do: [ :action | action value: script value: canvas ].
			anchor script: (canvas jQuery this onClick: script) ].

	self
		assert: html
		equals:
			'<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){$("#willow-dialog-section").children("dialog").last().removeAttr("open")});</script>'
]

{ #category : #'tests-accessing' }
DialogClosingCommandTest >> testModelLoadingActionsWhenRemovingAllDialogs [

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
		equals:
			'<a id="a-id1"></a><script type="text/javascript">$("#a-id1").click(function(){$("#willow-dialog-section").children("dialog").removeAttr("open")});</script>'
]

{ #category : #'tests-accessing' }
DialogClosingCommandTest >> testPriorityActions [

	self assert: command priorityActions isEmpty
]

{ #category : #'tests-testing' }
DialogClosingCommandTest >> testRequiresSerialization [

	self deny: command requiresSerialization  
]

{ #category : #'tests-accessing' }
DialogClosingCommandTest >> testServerIndependentActions [

	self assert: command serverIndependentActions isEmpty
]
