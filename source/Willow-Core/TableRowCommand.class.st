"
I'm a command to be applied to a table row. I expect to be evaluated with the current row, the related object and a Canvas
"
Class {
	#name : #TableRowCommand,
	#superclass : #Object,
	#category : #'Willow-Core-Frontend'
}

{ #category : #Combining }
TableRowCommand >> + aTableRowCommand [

	^CompositeTableRowCommand applyingAll: (Array with: self with: aTableRowCommand)
]

{ #category : #Applying }
TableRowCommand >> applyTo: aTableRow for: aRelatedObject on: aCanvas [

	self subclassResponsibility
]

{ #category : #Converting }
TableRowCommand >> asTableRowCommand [

	^self
]
