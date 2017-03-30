*Willow-SeasideExtensions
scriptToExecute: aScriptBlock asAjaxScriptEvery: aNumber millsecondsUnless: aStoppingCondition

	| asynchronousCall |

	asynchronousCall := self jQuery ajax.
	asynchronousCall
		script: [ :script | 
			aStoppingCondition value
				ifFalse: [ script << (self scriptToExecute: aScriptBlock asAjaxScriptEvery: aNumber millsecondsUnless: aStoppingCondition) ].
			script << (aScriptBlock value: self) ].
	asynchronousCall addDecoration: (JSTimeout duration: aNumber).
	^ asynchronousCall