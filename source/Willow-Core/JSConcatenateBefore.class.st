Class {
	#name : 'JSConcatenateBefore',
	#superclass : 'JSStatement',
	#category : 'Willow-Core-WebInteraction',
	#package : 'Willow-Core',
	#tag : 'WebInteraction'
}

{ #category : 'printing' }
JSConcatenateBefore >> javascriptContentOn: aRenderer [

	aRenderer render: self statement.
	aRenderer document separator.
	super javascriptContentOn: aRenderer
]
