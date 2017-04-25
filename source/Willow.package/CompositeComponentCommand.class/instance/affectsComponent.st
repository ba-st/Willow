testing
affectsComponent

	^ commands notEmpty and: [ commands allSatisfy: [ :command | command affectsComponent ] ]