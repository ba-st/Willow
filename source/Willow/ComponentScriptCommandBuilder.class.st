"
I'm an scripting command builder
"
Class {
	#name : #ComponentScriptCommandBuilder,
	#superclass : #GRObject,
	#category : 'Willow-Frontend'
}

{ #category : #Building }
ComponentScriptCommandBuilder >> js: aBlockClosure [

	^ ComponentScriptCommand toExecute: aBlockClosure
]
