"
A PluggableTableRowCommandTest is a test class for testing the behavior of PluggableTableRowCommand
"
Class {
	#name : #PluggableTableRowCommandTest,
	#superclass : #WARenderingTest,
	#category : 'Willow-Tests-Frontend'
}

{ #category : #'tests-Applying' }
PluggableTableRowCommandTest >> testApplyToForOn [

	| html command |

	command := PluggableTableRowCommand toExecute: [:row :item :canvas | row id: item printString].
	html :=
		self renderUsing: [:canvas | | component |
			component := canvas tableRow.
			command applyTo: component for: 33 on: canvas].

	self assert: html equals: '<tr id="33"></tr>'
]
