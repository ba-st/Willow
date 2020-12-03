"
A SetRowSpanCommandTest is a test class for testing the behavior of SetRowSpanCommand
"
Class {
	#name : #SetRowSpanCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-Frontend'
}

{ #category : #tests }
SetRowSpanCommandTest >> testApplyToOn [

	| html |

	html := self apply: (SetRowSpanCommand setting: 3) toComponentDefinedBy: [ :canvas | canvas tableData ].
	self assert: html equals: '<td rowspan="3"></td>'
]
