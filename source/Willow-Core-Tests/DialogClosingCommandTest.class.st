"
A DialogClosingCommandTest is a test class for testing the behavior of DialogClosingCommand
"
Class {
	#name : #DialogClosingCommandTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'command'
	],
	#category : #'Willow-Core-Tests-WebInteraction'
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

{ #category : #initialization }
DialogClosingCommandTest >> setUp [

	super setUp.
	command := DialogClosingCommand forAllDialogs
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
			DialogClosingCommand onlyForLastDialog modelLoadingInstructions appendTo: script on: canvas.
			anchor script: ( canvas jQuery this onClick: script )
			].

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
			command modelLoadingInstructions appendTo: script on: canvas.
			anchor script: ( canvas jQuery this onClick: script )
			].

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
DialogClosingCommandTest >> testServerIndependentInstructions [

	self assert: command serverIndependentInstructions isEmpty
]
