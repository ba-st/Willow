test
testForNumbers

	| interpreter |

	interpreter := InputInterpreter forNumbers.
	self
		assert: (interpreter interpretFrom: '45.3') equals: 45.3;
		assert: (interpreter inputFor: 1 / 3) equals: '(1/3)'