"
A DeselectAllOptionsCommandTest is a test class for testing the behavior of DeselectAllOptionsCommand
"
Class {
	#name : #DeselectAllOptionsCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-Frontend'
}

{ #category : #'tests-processing' }
DeselectAllOptionsCommandTest >> testApplyToOn [

	| html |

	html := self apply: DeselectAllOptionsCommand new toComponentDefinedBy: [ :canvas | canvas select ].

	self assert: html equals: '<select id="id1"></select><script type="text/javascript">$("#id1").prop("selectedIndex",-1);</script>'
]
