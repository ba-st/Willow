"
A ListLabelingCommandTest is a test class for testing the behavior of ListLabelingCommand
"
Class {
	#name : #ListLabelingCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-Frontend'
}

{ #category : #'tests-processing' }
ListLabelingCommandTest >> testApplyToOn [

	| html |

	html := self
		apply: (ListLabelingCommand with: [ :string | string asUppercase ])
		toComponentDefinedBy: [ :canvas | canvas select list: #('one' 'two') ].

	self assert: html equals: '<select><option>ONE</option><option>TWO</option></select>'
]
