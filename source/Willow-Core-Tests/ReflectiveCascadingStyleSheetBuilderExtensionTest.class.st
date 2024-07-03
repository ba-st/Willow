"
I'm a test case for Willow extensions to the CSS builder
"
Class {
	#name : 'ReflectiveCascadingStyleSheetBuilderExtensionTest',
	#superclass : 'TestCase',
	#category : 'Willow-Core-Tests-Frontend',
	#package : 'Willow-Core-Tests',
	#tag : 'Frontend'
}

{ #category : 'tests' }
ReflectiveCascadingStyleSheetBuilderExtensionTest >> testClassification [

	self assert: ReflectiveCascadingStyleSheetBuilder new classification equals: Willow classification
]
