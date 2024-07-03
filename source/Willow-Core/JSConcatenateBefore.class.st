Class {
	#name : 'JSConcatenateBefore',
	#superclass : 'JSStatement',
	#category : 'Willow-Core-WebInteraction',
	#package : 'Willow-Core',
	#tag : 'WebInteraction'
}

{ #category : 'printing' }
JSConcatenateBefore >> javascriptContentOn: aStream [

	aStream
		javascript: self statement;
		nextPut: $;.
	super javascriptContentOn: aStream
]
