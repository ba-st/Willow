"
I provide configuration for a Willow Application. For the moment the deployment mode.
"
Class {
	#name : #WillowSystemConfiguration,
	#superclass : #WASystemConfiguration,
	#category : #'Willow-Core-Applications'
}

{ #category : #Accessing }
WillowSystemConfiguration class >> deploymentModeClassKey [

	 ^#deploymentModeClass
]

{ #category : #Accessing }
WillowSystemConfiguration class >> languageKey [

	 ^#language
]

{ #category : #description }
WillowSystemConfiguration >> describeOn: config [

	(config classBinding: self class deploymentModeClassKey)
		comment: 'The deployment mode of the application.';
		options: WADeploymentMode subclasses;
		default: WAApplicationInDevelopment.

	(config string: self class languageKey)
		group: #willow;
		comment: 'The language of the application ("en" if absent)';
		default: 'en'
]
