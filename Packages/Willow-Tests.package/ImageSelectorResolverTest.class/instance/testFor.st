test
testFor

	| resolver |

	resolver := ImageSelectorResolver new.
	self assert: (resolver for: 'The first attempt') equals: 'TheFirstAttempt.png'