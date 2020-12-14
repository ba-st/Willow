Class {
	#name : #AddTimestampToSourceCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-Frontend'
}

{ #category : #'tests-processing' }
AddTimestampToSourceCommandTest >> testApplyToOn [

	| html upToTime afterTime |

	html := self
		apply: AddTimestampToSourceCommand new
		toComponentDefinedBy: [ :canvas | 
			canvas image
				url: (WAUrl absolute: 'here');
				yourself ].
	upToTime := '<img alt="" src="/here?time='.
	afterTime := '"/>'.

	self
		assert: (html copyFrom: 1 to: upToTime size) equals: upToTime;
		assert: (html copyFrom: html size - afterTime size + 1 to: html size)
			equals: afterTime
]
