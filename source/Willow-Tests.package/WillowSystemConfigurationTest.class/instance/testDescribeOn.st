tests-description
testDescribeOn

	| config description attribute |

	config := WillowSystemConfiguration instance.
	description := config buildDescription.
	attribute := description attributes at: WillowSystemConfiguration deploymentModeClassKey.
	self assert: attribute comment equals: 'The deployment mode of the application.'.

	attribute := description attributes at: WillowSystemConfiguration languageKey.
	self
		assert: attribute default equals: 'en';
		assert: attribute comment equals: 'The language of the application ("en" if absent)'