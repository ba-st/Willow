tests-description
testDescribeOn

	| config description attribute |

	config := WillowSystemConfiguration instance.
	description := config buildDescription.
	attribute := description attributes at: WillowSystemConfiguration deploymentModeClassKey.
	self assert: attribute comment equals: 'The deployment mode of the application.'