Class {
	#name : #DocumentLoadTrigger,
	#superclass : #TriggeringPolicy,
	#category : #'Willow-WebInteraction'
}

{ #category : #evaluating }
DocumentLoadTrigger >> apply: anAsynchronousCall to: aComponent on: aCanvas [

	aCanvas document addLoadScript: anAsynchronousCall
]
