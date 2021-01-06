"
A DateInputModeCommandTest is a test class for testing the behavior of DateInputModeCommand
"
Class {
	#name : #InputModeCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-Frontend'
}

{ #category : #'tests-processing' }
InputModeCommandTest >> testApplyDateInputCommand [

	| html |

	html := self apply: InputModeCommand asDate toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: (self renderUsing: [ :canvas | canvas dateInput5 ])
]

{ #category : #'tests-processing' }
InputModeCommandTest >> testApplyNumberInputCommand [

	| html |

	html := self apply: InputModeCommand asNumber toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: (self renderUsing: [ :canvas | canvas numberInput ])
]

{ #category : #'tests-processing' }
InputModeCommandTest >> testApplyPasswordInputCommand [

	| html |

	html := self apply: InputModeCommand asPassword toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input type="password"/>'
]

{ #category : #'tests-processing' }
InputModeCommandTest >> testApplyTimeInputCommand [

	| html |

	html := self apply: InputModeCommand asTime toComponentDefinedBy: [ :canvas | canvas textInput ].

	self assert: html equals: '<input type="time"/>'
]
