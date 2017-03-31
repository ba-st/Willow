*Willow-SeasideExtensions
every: aNumber millisecondsEvaluateAsAjaxScript: aScriptBlock until: aStoppingCondition

	self script: (
		self
			scriptToExecute: aScriptBlock
			asAjaxScriptEvery: aNumber
			millsecondsUnless: aStoppingCondition)