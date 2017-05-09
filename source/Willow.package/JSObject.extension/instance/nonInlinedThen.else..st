*Willow-SeasideExtensions
nonInlinedThen: anObject else: anotherObject

	self
		addDecoration:
			(JSNonInlinedIfThenElse new
				trueStatement: anObject;
				falseStatement: anotherObject)