private
setUpWillowGlobalNamespace

	^ (self willowNamespace identicalTo: JSStream undefined)
		nonInlinedThen: (self willowNamespace assign: self willowDefaults)