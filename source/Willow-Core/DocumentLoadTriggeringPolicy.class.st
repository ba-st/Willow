Class {
	#name : #DocumentLoadTriggeringPolicy,
	#superclass : #TriggeringPolicy,
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #evaluating }
DocumentLoadTriggeringPolicy >> apply: anAsynchronousCall to: aComponent on: aCanvas [

	aCanvas document addLoadScript: anAsynchronousCall
]
