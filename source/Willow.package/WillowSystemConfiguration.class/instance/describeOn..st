description
describeOn: config

	(config classBinding: self class deploymentModeClassKey)
		comment: 'The deployment mode of the application.';
		options: WillowApplicationDeploymentMode subclasses;
		default: WillowApplicationInDevelopment