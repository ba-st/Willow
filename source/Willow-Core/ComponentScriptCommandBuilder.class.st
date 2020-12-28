"
I'm an scripting command builder
"
Class {
	#name : #ComponentScriptCommandBuilder,
	#superclass : #GRObject,
	#category : #'Willow-Core-Frontend'
}

{ #category : #Building }
ComponentScriptCommandBuilder >> js: aBlockClosure [

	^ ComponentScriptCommand toExecute: aBlockClosure
]
