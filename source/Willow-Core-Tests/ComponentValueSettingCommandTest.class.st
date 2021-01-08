"
A ComponentValueSettingCommandTest is a test class for testing the behavior of ComponentValueSettingCommand
"
Class {
	#name : #ComponentValueSettingCommandTest,
	#superclass : #BWRenderingTest,
	#instVars : [
		'command'
	],
	#category : #'Willow-Core-Tests-WebInteraction'
}

{ #category : #initialization }
ComponentValueSettingCommandTest >> setUp [

	super setUp.
	command := ComponentValueSettingCommand obtainingIdentifierFrom: [ 'id-12' ] valueFrom: [ '3' ]
]

{ #category : #'tests-accessing' }
ComponentValueSettingCommandTest >> testModelLoadingActionsWithoutSettingPreviouslyTheId [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script input |

			script := canvas javascript.
			input := canvas textInput.

			( ComponentValueSettingCommand triggeringChangesOn: input withValueFrom: [ '15' ] )
				modelLoadingInstructions appendTo: script on: canvas.
			input script: ( canvas jQuery this onClick: script )
			].

	self
		assert: html
		equals:
			'<input id="id1" type="text"/><script type="text/javascript">$("#id1").click(function(){$("#id1").val("15").trigger("change")});</script>'
]

{ #category : #'tests-accessing' }
ComponentValueSettingCommandTest >> testModelLoadingActionsWithoutTriggering [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script input |

			script := canvas javascript.
			input := canvas textInput.
			canvas ensureIdFor: input.
			( ComponentValueSettingCommand
				obtainingIdentifierFrom: [ input identifierOn: canvas ]
				valueFrom: [ '15' ] ) modelLoadingInstructions appendTo: script on: canvas.
			input script: ( canvas jQuery this onClick: script )
			].

	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(){$("#input-id1").val("15")});</script>'
]

{ #category : #'tests-accessing' }
ComponentValueSettingCommandTest >> testModelLoadingInstructions [

	| html |

	html := self
		renderUsing: [ :canvas | 
			| script input |

			script := canvas javascript.
			input := canvas textInput.
			canvas ensureIdFor: input.
			( ComponentValueSettingCommand
				triggeringChangesObtainingIdentifierFrom: [ input identifierOn: canvas ]
				valueFrom: [ '15' ] ) modelLoadingInstructions appendTo: script on: canvas.
			input script: ( canvas jQuery this onClick: script )
			].

	self
		assert: html
		equals:
			'<input id="input-id1" type="text"/><script type="text/javascript">$("#input-id1").click(function(){$("#input-id1").val("15").trigger("change")});</script>'
]

{ #category : #'tests-accessing' }
ComponentValueSettingCommandTest >> testPriorityActions [

	self assert: command priorityActions isEmpty
]

{ #category : #'tests-testing' }
ComponentValueSettingCommandTest >> testRequiresSerialization [

	self deny: command requiresSerialization
]

{ #category : #'tests-accessing' }
ComponentValueSettingCommandTest >> testServerIndependentInstructions [

	self assert: command serverIndependentInstructions isEmpty
]
