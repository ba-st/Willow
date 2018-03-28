accessing
deploymentMode

	^ (self session preferenceAt: WillowSystemConfiguration deploymentModeClassKey ifAbsent: [ WAApplicationInDevelopment ]) new