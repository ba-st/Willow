Extension { #name : #WAHtmlCanvas }

{ #category : #'*Willow' }
WAHtmlCanvas >> dialog [

	^ self tag: 'dialog'
]

{ #category : #'*Willow' }
WAHtmlCanvas >> every: aNumber millisecondsEvaluateAsAjaxScript: aScriptBlock until: aStoppingCondition [

	self script: (self scriptToExecute: aScriptBlock asAjaxScriptEvery: aNumber millsecondsUnless: aStoppingCondition)
]

{ #category : #'*Willow' }
WAHtmlCanvas >> icon [

	^ self tag: 'i'
]

{ #category : #'*Willow' }
WAHtmlCanvas >> scriptToExecute: aScriptBlock asAjaxScriptEvery: aNumber millsecondsUnless: aStoppingCondition [

	| asynchronousCall |

	asynchronousCall := self jQuery ajax.
	asynchronousCall
		script: [ :script | 
			aStoppingCondition value
				ifFalse: [ script << (self scriptToExecute: aScriptBlock asAjaxScriptEvery: aNumber millsecondsUnless: aStoppingCondition) ].
			script << (aScriptBlock value: self) ].
	asynchronousCall addDecoration: (JSTimeout duration: aNumber).
	^ asynchronousCall
]
