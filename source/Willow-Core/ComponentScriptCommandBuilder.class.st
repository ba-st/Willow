"
I'm an scripting command builder
"
Class {
	#name : 'ComponentScriptCommandBuilder',
	#superclass : 'GRObject',
	#category : 'Willow-Core-Frontend',
	#package : 'Willow-Core',
	#tag : 'Frontend'
}

{ #category : 'Building' }
ComponentScriptCommandBuilder >> js: aBlockClosure [

	^ ComponentScriptCommand toExecute: aBlockClosure
]
