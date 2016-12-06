test
testTextAfterNumeralIsIgnored

	| resolver |

	resolver := ImageSelectorResolver new.
	self assert: (resolver for: 'something to do # but not this part') equals: 'SomethingToDo.png'