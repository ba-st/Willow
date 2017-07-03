description
describeOn: config

	(config classBinding: self class deploymentModeClassKey)
		comment: 'The deployment mode of the application.';
		options: WillowApplicationDeploymentMode subclasses;
		default: WillowApplicationInDevelopment.

	(config string: self class languageKey)
		group: #willow;
		comment: 'The language of the application ("en" if absent)';
		default: 'en'