test
testForText

	| interpreter |

	interpreter := InputInterpreter forText.
	self
		assert: (interpreter interpretFrom: 'leave it like this') equals: 'leave it like this';
		assert: (interpreter inputFor: 'be the same') equals: 'be the same'