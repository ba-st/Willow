configuring
doesNotUnderstand: aMessage

	^ (interpreters
		allSatisfy: [ :interpreter | (interpreter isA: self class) or: [ interpreter respondsTo: aMessage selector ] ])
		ifTrue: [ interpreters do: [ :interpreter | interpreter perform: aMessage selector withEnoughArguments: aMessage arguments ] ]
		ifFalse: [ super doesNotUnderstand: aMessage ]