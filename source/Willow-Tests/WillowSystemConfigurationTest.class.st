"
A WillowSystemConfigurationTest is a test class for testing the behavior of WillowSystemConfiguration
"
Class {
	#name : #WillowSystemConfigurationTest,
	#superclass : #TestCase,
	#category : #'Willow-Tests-Applications'
}

{ #category : #'tests-description' }
WillowSystemConfigurationTest >> testDescribeOn [

	| config description attribute |

	config := WillowSystemConfiguration instance.
	description := config buildDescription.
	attribute := description attributes at: WillowSystemConfiguration deploymentModeClassKey.
	self assert: attribute comment equals: 'The deployment mode of the application.'.

	attribute := description attributes at: WillowSystemConfiguration languageKey.
	self
		assert: attribute default equals: 'en';
		assert: attribute comment equals: 'The language of the application ("en" if absent)'
]
