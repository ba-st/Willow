"
A RenderingCommandTest is a test class for testing the behavior of RenderingCommand
"
Class {
	#name : #RenderingCommandTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'identifiedView',
		'command'
	],
	#category : #'Willow-Core-Tests-WebInteraction'
}

{ #category : #initialization }
RenderingCommandTest >> setUp [

	super setUp.
	identifiedView := ContainerWebView
		wrapping: [ :canvas | canvas span: 'Test' ]
		intoElementBuiltUsing: [ :canvas | canvas div ]
		applying: [  ].
	command := RenderingCommand for: identifiedView
]

{ #category : #'tests-accessing' }
RenderingCommandTest >> testModelLoadingInstructions [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script |

			script := canvas javascript.
			identifiedView identifierOn: canvas.
			command modelLoadingInstructions appendTo: script on: canvas.
			canvas anchor script: ( canvas jQuery this onClick: script )
			].

	self
		assert: html
		equals:
			'<a id="id2"></a><script type="text/javascript">$("#id2").click(function(){$("#container-id1").html("<span>Test</span>")});</script>'
]

{ #category : #'tests-accessing' }
RenderingCommandTest >> testPriorityActions [

	self assert: command priorityActions isEmpty
]

{ #category : #'tests-testing' }
RenderingCommandTest >> testRequiresSerialization [

	self assert: command requiresSerialization 
]

{ #category : #'tests-accessing' }
RenderingCommandTest >> testServerIndependentInstructions [

	self assert: command serverIndependentInstructions isEmpty
]
