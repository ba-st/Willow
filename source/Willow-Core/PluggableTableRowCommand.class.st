"
I'm a configurable table row command
"
Class {
	#name : #PluggableTableRowCommand,
	#superclass : #TableRowCommand,
	#instVars : [
		'block'
	],
	#category : #'Willow-Core-Frontend'
}

{ #category : #'instance creation - private' }
PluggableTableRowCommand class >> toExecute: aTryadicBlock [

	^self new initializeToExecute: aTryadicBlock
]

{ #category : #Applying }
PluggableTableRowCommand >> applyTo: aTableRow for: aRelatedObject on: aCanvas [

	block value: aTableRow value: aRelatedObject value: aCanvas
]

{ #category : #initialization }
PluggableTableRowCommand >> initializeToExecute: aTryadicBlock [

	block := aTryadicBlock
]
