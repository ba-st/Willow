Class {
	#name : #CompositeTableRowCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-Frontend'
}

{ #category : #tests }
CompositeTableRowCommandTest >> testApplyToForOn [

	| html command |
	
	command := 
		CompositeTableRowCommand applyingAll: (
			Array with:
				(PluggableTableRowCommand toExecute: [:row :item :canvas | row id: item printString])).
	html :=
		self renderUsing: [ :canvas | | component |
			component := canvas tableRow.
			command applyTo: component for: 33 on: canvas ].
	
	self assert: html equals: '<tr id="33"></tr>'
]

{ #category : #tests }
CompositeTableRowCommandTest >> testEmpty [

	| html command |
	
	command := CompositeTableRowCommand empty.
	html :=
		self renderUsing: [ :canvas | | component |
			component := canvas tableRow.
			command applyTo: component for: 33 on: canvas ].
	
	self assert: html equals: '<tr></tr>'
]

{ #category : #tests }
CompositeTableRowCommandTest >> testShortcutCreation [

	| html command |
	
	command := 
		(PluggableTableRowCommand toExecute: [:row :item :canvas | row id: item printString]) +			
			(PluggableTableRowCommand toExecute: [:row :item :canvas | row class: 'secret']).
	html :=
		self renderUsing: [ :canvas | | component |
			component := canvas tableRow.
			command applyTo: component for: 33 on: canvas ].
	
	self assert: html equals: '<tr id="33" class="secret"></tr>'
]

{ #category : #tests }
CompositeTableRowCommandTest >> testShortcutCreationWithEmptyCompositeCommand [

	| html command |
	
	command := 
		CompositeTableRowCommand empty +
			(PluggableTableRowCommand toExecute: [:row :item :canvas | row id: item printString]).
	html :=
		self renderUsing: [ :canvas | | component |
			component := canvas tableRow.
			command applyTo: component for: 33 on: canvas ].
	
	self assert: html equals: '<tr id="33"></tr>'
]
