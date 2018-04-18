Class {
	#name : #TriggeringPolicy,
	#superclass : #Object,
	#category : 'Willow-WebInteraction'
}

{ #category : #evaluating }
TriggeringPolicy >> apply: anAsynchronousCall to: aComponent on: aCanvas [

	self subclassResponsibility
]
