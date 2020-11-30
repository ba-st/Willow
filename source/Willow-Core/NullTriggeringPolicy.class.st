"
I'm a triggering policy specifing that no triggering must happen. So if someone tries to use me I will fail.
"
Class {
	#name : #NullTriggeringPolicy,
	#superclass : #TriggeringPolicy,
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #evaluating }
NullTriggeringPolicy >> apply: anAsynchronousCall to: aComponent on: aCanvas [

	Error signal: 'Trying to generate interactive script for component declared as non-interactive'
]
