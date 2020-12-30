"
A row command collecting several sub commands to a component.
"
Class {
	#name : #CompositeTableRowCommand,
	#superclass : #TableRowCommand,
	#instVars : [
		'commands'
	],
	#category : #'Willow-Core-Frontend'
}

{ #category : #'instance creation' }
CompositeTableRowCommand class >> applyingAll: aCommandCollection [

	^self new initializeApplyingAll: aCommandCollection
]

{ #category : #'instance creation' }
CompositeTableRowCommand class >> empty [

	^self applyingAll: #()
]

{ #category : #Combining }
CompositeTableRowCommand >> + aTableRowCommand [

	^self class applyingAll: (
		OrderedCollection new 
			addAll: commands;
			add: aTableRowCommand;
			yourself)
]

{ #category : #Applying }
CompositeTableRowCommand >> applyTo: aTableRow for: aRelatedObject on: aCanvas [

 	commands do: [ :command | command applyTo: aTableRow for: aRelatedObject on: aCanvas ]
]

{ #category : #'initialize-release' }
CompositeTableRowCommand >> initializeApplyingAll: aCommandCollection [

	commands := OrderedCollection withAll: aCommandCollection
]
