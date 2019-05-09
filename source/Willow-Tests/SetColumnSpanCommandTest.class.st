Class {
	#name : #SetColumnSpanCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-Frontend'
}

{ #category : #'tests-processing' }
SetColumnSpanCommandTest >> testApplyToOn [

	| html |

	html := self
		apply: (SetColumnSpanCommand setting: 3)
		toComponentDefinedBy: [ :canvas | canvas tableData ].
	self assert: html equals: '<td colspan="3"></td>'
]
