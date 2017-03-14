initialize-release
initializeWithBehaviorDeterminedBy: aBlock requiring: aHolder

	behaviorCallback := aBlock.
	clientSideParameterHolder := aHolder.
	serverSideParameterHolder := clientSideParameterHolder
		withContentDo: [ :clientSideParameter | Holder containing: InvalidSelection new ]
		ifUnused: [ clientSideParameterHolder ].
	self resetInterpreter