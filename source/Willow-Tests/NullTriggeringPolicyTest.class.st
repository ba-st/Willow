"
A NullTriggeringPolicyTest is a test class for testing the behavior of NullTriggeringPolicy
"
Class {
	#name : #NullTriggeringPolicyTest,
	#superclass : #WARenderingTest,
	#category : 'Willow-Tests-WebInteraction'
}

{ #category : #'tests-evaluating' }
NullTriggeringPolicyTest >> testApplyToOn [

	self
		renderUsing: [ :canvas | 
			| component ajax |

			ajax := canvas jQuery ajax.
			component := canvas textInput.
			self
				should: [ NullTriggeringPolicy new apply: ajax to: component on: canvas ]
				raise: Error
				withExceptionDo: [ :error | 
					self
						assert: error messageText
						equals: 'Trying to generate interactive script for component declared as non-interactive' ] ]
]
