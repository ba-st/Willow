Extension { #name : #WAHtmlCanvas }

{ #category : #'*Willow-Core' }
WAHtmlCanvas >> dialog [

	^ self tag: 'dialog'
]

{ #category : #'*Willow-Core' }
WAHtmlCanvas >> every: aNumber millisecondsEvaluateAsAjaxScript: aScriptBlock until: aStoppingCondition [

	self script: (self scriptToExecute: aScriptBlock asAjaxScriptEvery: aNumber millsecondsUnless: aStoppingCondition)
]

{ #category : #'*Willow-Core' }
WAHtmlCanvas >> icon [

	^ self tag: 'i'
]

{ #category : #'*Willow-Core' }
WAHtmlCanvas >> scriptToExecute: aScriptBlock asAjaxScriptEvery: aNumber millsecondsUnless: aStoppingCondition [

	| asynchronousCall |

	asynchronousCall := self jQuery ajax.
	asynchronousCall
		script: [ :script | 
			[ script
				<<
					( self
						scriptToExecute: aScriptBlock
						asAjaxScriptEvery: aNumber
						millsecondsUnless: aStoppingCondition )
			] unless: aStoppingCondition value.
			script << ( aScriptBlock value: self )
			].
	asynchronousCall addDecoration: ( JSTimeout duration: aNumber ).
	^ asynchronousCall
]
