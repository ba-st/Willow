private
considerAddingConditionTo: anAsynchronousCall

	optionalClientCondition
		withContentDo: [ :clientCondition | anAsynchronousCall condition: (JSStream on: clientCondition) ]