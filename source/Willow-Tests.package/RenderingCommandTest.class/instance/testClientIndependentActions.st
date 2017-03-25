tests-accessing
testClientIndependentActions

	self assert: command clientIndependentActions size equals: 1.
	command clientIndependentActions do: [ :action | self assert: action value ]