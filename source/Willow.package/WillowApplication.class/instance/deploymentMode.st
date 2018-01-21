accessing
deploymentMode

	^ (self session preferenceAt: WillowSystemConfiguration deploymentModeClassKey ifAbsent: [ WillowApplicationInDevelopment ]) new