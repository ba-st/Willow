tests
testStartUpApplicationContextFor

	| session |

	session := WillowSession new.
	session startUpApplicationContextFor: self.
	self assert: session componentSupplier equals: componentSupplier