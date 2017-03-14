initialize-release
initializeFor: aCallback requiring: aHolder

	callbackToEvaluate := aCallback.
	clientSideParameterHolder := aHolder.
	serverSideParameterHolder := clientSideParameterHolder
				withContentDo: [:clientSideParameter | Holder containing: InvalidSelection new]
				ifUnused: [:explanations | UnusedHolder explainedByAll: explanations]