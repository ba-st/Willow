"
A command to deselect all the options in a select
"
Class {
	#name : #DeselectAllOptionsCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'scriptCommand'
	],
	#category : #'Willow-Frontend'
}

{ #category : #processing }
DeselectAllOptionsCommand >> applyTo: aSelect on: aCanvas [

	scriptCommand applyTo: aSelect on: aCanvas
]

{ #category : #initialization }
DeselectAllOptionsCommand >> initialize [

	super initialize.
	scriptCommand := ComponentScriptCommand toExecute: [ :canvas | canvas jQuery this propertyAt: 'selectedIndex' put: -1 ]
]
